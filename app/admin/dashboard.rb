ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end    

  controller do
    before_filter :check_for_administrator
    
    def check_for_administrator
        redirect_to '/', :alert => 'You are not an administrator!' unless current_user.has_role?(:staff) || current_user.has_role?(:god) 
    end

  end
  
end
