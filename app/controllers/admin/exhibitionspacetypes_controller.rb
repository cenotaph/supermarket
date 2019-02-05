# frozen_string_literal: true

class Admin::ExhibitionspacetypesController < Admin::BaseController
  def create
    create! { admin_exhibitionspacetypes_path }
  end

  def update
    update! { admin_exhibitionspacetypes_path }
  end

  protected

  def permitted_params
    params.permit(exhibitionspacetype: [translations_attributes: %i[locale id name]])
  end
end
