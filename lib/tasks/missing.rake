class Oldcmscmscontentfieldapporganization < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_organization"
end
class Olduser < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmsusers"
end

class Oldcmsnode < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
 
  self.inheritance_column =  :_type_disabled
  self.table_name =  "_cmsnode"
end


namespace :aim do
  namespace :missing do
    task :logos => :environment do
      Space.where("logo is not null").each do |s|
        begin
          getit = open(s.logo.url.gsub('aim-development', 'aim-production'))
        rescue 
          newlogo = s.logo.url.gsub(/space\/logo\//, '').gsub('aim-development', 'aim-production') 
          puts 'attempting ' + newlogo
          s.remote_logo_url =  newlogo
          s.save
        end
      end
    end
    
    task :organisation_description => :environment do
      Oldcmsnode.all.sort_by{|x| x.type}.each do |cmsnode|
        next unless cmsnode.type =~ /^application/
        year = cmsnode.type.match(/\_(\d{4})$/)[1] rescue next
        user = Olduser.find(cmsnode.uid)
        nid = cmsnode.nid
        vid = cmsnode.vid
        existing = Application.find_by(:user => User.find_by(:email => user.mail), :year => Year.find_by(:year => year))
        if existing.nil?
          exit "cannot find application for nid #{nid} vid #{vid} and year #{year}"
        else
          puts "found app #{existing.id.to_s}"
           Oldcmscmscontentfieldapporganization.where(:nid => nid, :vid => vid).each do |org|
             existing.organisation_description = org.field_app_organization_value
           end
           if existing.changed?
             existing.save
           end
        end
      end
    end
  end
end

        