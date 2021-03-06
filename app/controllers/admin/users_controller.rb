# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  handles_sortable_columns
  autocomplete :user, :display_name
  autocomplete :user, :email, extra_data: [:email], display_value: :email
  has_scope :by_email

  def filter_name
    order = sortable_column_order do |column, direction|
      case column
      when 'display_name'
        "#{column} #{direction}"
      when 'initiative'
        "lower(spaces.business_name) #{direction}"
      when 'roles'
        "roles.name #{direction}"
      else
        'last_sign_in_at DESC'
      end
    end
    if params[:display_name].blank?
      redirect_to admin_users_path
    else
      @users = User.includes(%i[roles spaces]).references(:space_users).where("lower(display_name) LIKE lower('%" + params[:display_name] + "%')").order(order).page(params[:page]).per(100)
      render template: 'admin/users/index'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user || current_user.has_role?(:god)
      if @user.update(user_params)
        flash[:notice] = 'Profile updated.'
        redirect_to '/admin'
      else
        flash[:error] = 'Error saving profile: ' + @user.errors.full_messages.join
        render template: 'admin/users/edit'
      end
    else
      flash[:error] = 'You cannot edit another user.'
      redirect_to '/admin'
    end
  end

  def index
    order = sortable_column_order do |column, direction|
      case column
      when 'display_name'
        "#{column} #{direction}"
      when 'initiative'
        "lower(spaces.business_name) #{direction}"
      when 'roles'
        "roles.name #{direction}"
      else
        'last_sign_in_at DESC'
      end
    end

    respond_to do |format|
      format.html do
        @users = apply_scopes(User).includes(%i[roles spaces]).references(:space_users).order(order).page(params[:page]).per(100)
      end
      format.csv do
        @users = User.all
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:photo, :remove_photo, :display_name, :email, role_ids: [])
  end
end
