class SpaceMailer < ActionMailer::Base
   
  
  def aim_add_user_access(space, new_user, token)
    @space = space
    @new_user = new_user
    @token = token
    @space.approved_users.delete_if{|x| x == new_user}.each do |user|
      mail(to: user.email, from: "support@artistrunmap.org", subject: new_user.display_name + ' requests access to edit Artist Run Map info for ' + @space.name)
    end
  end
  def supermarket2014_add_user_access(space, new_user, token)
    @space = space
    @new_user = new_user
    @token = token
    @space.approved_users.delete_if{|x| x == new_user}.each do |user|
      mail(to: user.email, from: "info@supermarketartfair.com", subject: new_user.display_name + ' requests access to edit Supermarket info for ' + @space.name)
    end
  end
    
end
