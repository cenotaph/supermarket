class SpaceMailer < ActionMailer::Base
  default from: "info@supermarketartfair.com"
  
  def add_user_access(space, new_user, token)
    @space = space
    @new_user = new_user
    @token = token
    @space.approved_users.delete_if{|x| x == new_user}.each do |user|
      mail(to: user.email, subject: new_user.display_name + ' requests access to edit Supermarket info for ' + @space.name)
    end
  end
  
end
