
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

class Oldcmscontenttypeapplication2012 < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_type_application_2012"
end

class Oldcmscmscontentfieldappcontactfirstname < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_first_name"
end

class Oldcmscmscontentfieldappcontactlastname < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_last_name"
end

class Oldcmscmscontentfieldappcontactmoms < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_moms"
end

class Oldcmscmscontentfieldappcontactphone < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_phone"
end
class Oldcmscmscontentfieldappcontactposttown < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_post_town"
end
class Oldcmscmscontentfieldappcontactpostaladdress < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_postal_address"
end
class Oldcmscmscontentfieldappcontactpostcode < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_contact_postcode"
end


class Oldcmscmscontentfieldappcontactcountry < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_country"
end

class Oldcmscmscontentfieldappemail < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_email"
end

class Oldcmscmscontentfieldapporganizationname < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_organization_name"
end

class Oldcmscmscontentfieldappapptext < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_apptext"
end

class Oldcmscmscontentfieldappbooth < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_booth"
end


class Oldcmscmscontentfieldappboothgranted < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_booth_granted"
end

class Oldcmscmscontentfieldapplistmembers < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_list_members"
end


class Oldcmscmscontentfieldappphone < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_phone"
end


class Oldcmscmscontentfieldappposttown < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_post_town"
end
class Oldcmscmscontentfieldapppostaladdress < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_postal_address"
end
class Oldcmscmscontentfieldapppostcode < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_postcode"
end
class Oldcmscmscontentfieldappwebsite < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmscontent_field_app_website"
end
class Oldusers < ActiveRecord::Base
  establish_connection(
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "supermarketartfair_com"
  )
  self.table_name =  "_cmsusers"
end

class User < ActiveRecord::Base
  establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :username => "fail",
    :password => "",
    :database => "aim_development"
  )
end  

  
namespace :aim do
  namespace :create do
    task :spaces_from_applications => :environment do
      Application.includes(:year).order("years.year").each do |app|
        space = nil

        space = Space.where(:business_name => app.organisation_name)
 
        # populate country field
        ccountry = Country.find_country_by_name(app.contact_country)
        if ccountry.nil?
          country = ''
        else
          country = ccountry.alpha2
        end
        if app.exhibitor_country == app.contact_country
          ecountry = country
        else
          cccountry = Country.find_country_by_name(app.exhibitor_country)
          if cccountry.nil?
            ecountry = ''
          else
            ecountry = cccountry.alpha2
          end
        end
        
        # doesn't exist
         if space.empty?     
          space = Space.create(:business_name => app.organisation_name, :contact_person => app.contact_first_name + " " + app.contact_last_name,
                               :address1 => app.contact_address1, :city => app.contact_city, :postcode => app.contact_postcode,
                               :country => country, :visiting_address1 => app.exhibitor_address1, 
                               :visiting_city => app.exhibitor_city, :visiting_country => ecountry, 
                               :visiting_postcode => app.exhibitor_postcode, :phone => app.exhibitor_phone,
                               :contact_phone => app.contact_phone, :short_description => app.organisation_description,
                               :approved => true
                              )
          space.users << app.user
          space.save(validate: false)
       
          app.space = space
          app.save(validate: false)
        # already exists?
        else
          if space.size > 1
            puts "More than one space named " + app.organisation_name + ": " + space.inspect
            exit
          else
            space = space.first
          end
          next if space.applications.include?(app)
          space.update_attributes(:business_name => app.organisation_name, :contact_person => app.contact_first_name + " " + app.contact_last_name,
                               :address1 => app.contact_address1, :city => app.contact_city, :postcode => app.contact_postcode,
                               :country => country, :visiting_address1 => app.exhibitor_address1, 
                               :visiting_city => app.exhibitor_city, :visiting_country => ecountry, 
                               :visiting_postcode => app.exhibitor_postcode, :phone => app.exhibitor_phone,
                               :contact_phone => app.contact_phone, :short_description => app.organisation_description, 
                               :approved => true
                              )
          puts 'saving space ' + space.id.to_s + ': ' + space.business_name 
          space.users << app.user unless space.users.include?(app.user)
          space.save(validate: false)
          puts "assinging space id " + space.id.to_s + " to application " + app.id.to_s
          app.space_id = space.id
          app.save(validate: false)
        end
      end
    end
  end
  
  namespace :convert do
    task :applications => :environment do
      Oldcmsnode.all.each do |cmsnode|
        next unless cmsnode.type =~ /^application/
        year = cmsnode.type.match(/\_(\d{4})$/)[1] rescue next
        user = Olduser.find(cmsnode.uid)
        application = Application.new(:year => Year.where(:year => year).first, 
                                      :submitted_at => Time.at(cmsnode[:created]).to_date,
                                      :status => 'active',
                                      :user => User.where(:email => user.mail).first)
                                      
        nid = cmsnode.nid
        vid = cmsnode.vid
        begin
          application.organisation_name = Oldcmscmscontentfieldapporganizationname.where(:nid => nid, :vid => vid).first.field_app_organization_name_value
          application.contact_first_name = Oldcmscmscontentfieldappcontactfirstname.where(:nid => nid, :vid => vid).first.field_app_contact_first_name_value
          application.contact_last_name = Oldcmscmscontentfieldappcontactlastname.where(:nid => nid, :vid => vid).first.field_app_contact_last_name_value
          application.contact_moms = Oldcmscmscontentfieldappcontactmoms.where(:nid => nid, :vid => vid).first.field_app_contact_moms_value  rescue nil
          application.contact_phone = Oldcmscmscontentfieldappcontactphone.where(:nid => nid, :vid => vid).first.field_app_contact_phone_value
          application.contact_address1 = Oldcmscmscontentfieldappcontactpostaladdress.where(:nid => nid, :vid => vid).first.field_app_contact_postal_address_value
          application.contact_city = Oldcmscmscontentfieldappcontactposttown.where(:nid => nid, :vid => vid).first.field_app_contact_post_town_value
          application.contact_postcode = Oldcmscmscontentfieldappcontactpostcode.where(:nid => nid, :vid => vid).first.field_app_contact_postcode_value
          application.supermarket_proposal =  Oldcmscmscontentfieldappapptext.where(:nid => nid, :vid => vid).first.field_app_apptext_value
          application.booth_applied =  Oldcmscmscontentfieldappbooth.where(:nid => nid, :vid => vid).first.field_app_booth_value
          application.booth_granted =  Oldcmscmscontentfieldappboothgranted.where(:nid => nid, :vid => vid).first.field_app_booth_granted_value          
          application.contact_country = Oldcmscmscontentfieldappcontactcountry.where(:nid => nid, :vid => vid).first.field_app_country_value
          application.contact_email = Oldcmscmscontentfieldappemail.where(:nid => nid, :vid => vid).first.field_app_email_value
          application.exhibitor_phone = Oldcmscmscontentfieldappphone.where(:nid => nid, :vid => vid).first.field_app_phone_value
          application.staff = Oldcmscmscontentfieldapplistmembers.where(:nid => nid, :vid => vid).first.field_app_list_members_value
          application.organisation_description = Oldcmscmscontentfieldapporganizationdescription.where(:nid => nid, :vid => vid).first.field_app_organization_value
          application.exhibitor_address1 = Oldcmscmscontentfieldapppostaladdress.where(:nid => nid, :vid => vid).first.field_app_postal_address_value
          application.exhibitor_city = Oldcmscmscontentfieldappposttown.where(:nid => nid, :vid => vid).first.field_app_post_town_value
          application.exhibitor_postcode = Oldcmscmscontentfieldapppostcode.where(:nid => nid, :vid => vid).first.field_app_postcode_value
          application.exhibitor_country = application.contact_country
          Oldcmscmscontentfieldappwebsite.where(:nid => nid, :vid => vid).each do |site|
            application.websites << site.field_app_website_url
          end
        rescue
          nil
        end
        application.save(validate: false)
      end
    end
    
    task :countries_to_downcase => :environment do
      Space.all.each do |s|
        s.country.downcase! unless s.country.nil?
        s.visiting_country.downcase! unless s.visiting_country.nil?
        s.save
      end
      Application.all.each do |a|
        unless a.contact_country.blank?
          c = Country.find_country_by_name(a.contact_country)
          unless c.nil?
            a.contact_country = c.alpha2.downcase
            a.save
          end
        end
        unless a.exhibitor_country.blank?
          c = Country.find_country_by_name(a.contact_country)
          unless c.nil?
            a.contact_country = c.alpha2.downcase
            a.save
          end
        end
      end
    end          
        
    task :users => :environment do
      Olduser.all.each do |ou|
        next if ou.mail.blank?
        u = User.new(:email => ou.mail, :display_name => ou.name, 
          :encrypted_password => ou.pass, :timezone => ou.timezone,
          :created_at => ou.created)
        # u.skip_confirmation!
        u.save!
      end
    end
  end
end