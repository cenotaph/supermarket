# frozen_string_literal: true

class Admin::BusinesstypesController < Admin::BaseController
  def create
    create! { admin_businesstypes_path }
  end

  def update
    update! { admin_businesstypes_path }
  end

  protected

  def permitted_params
    params.permit(businesstype: [translations_attributes: %i[locale id name]])
  end
end
