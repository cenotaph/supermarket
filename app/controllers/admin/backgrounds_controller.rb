# frozen_string_literal: true

class Admin::BackgroundsController < Admin::BaseController
  def create
    create! { admin_backgrounds_path }
  end

  def destroy
    destroy! { admin_backgrounds_path }
  end

  def update
    update! { admin_backgrounds_path }
  end

  protected

  def permitted_params
    params.permit(background: %i[name background_image published])
  end
end
