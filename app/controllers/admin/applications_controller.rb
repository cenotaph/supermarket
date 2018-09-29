class Admin::ApplicationsController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  has_scope :by_year
  handles_sortable_columns


  def comment
    @application = Application.find(params[:id])
    @application.applicationcomments << Applicationcomment.new(params[:applicationcomment].permit([:user_id, :application_id, :comment]) )
    if @application.save
      flash[:notice] = 'Your comment has been posted.'
    else
      flash[:error] = 'There was an error saving your comment.'
    end
    redirect_to @application
  end



  def index
    order = sortable_column_order do |column, direction|
      case column
      when "id"
        "id #{direction}"
      when "accepted_terms"
        "accepted_terms #{direction}"
      when "name"
        "LOWER(organisation_name) #{direction}"
      when "year"
        "years.year #{direction}"
      when "country"
        "exhibitor_country #{direction}"
      when "comments"
        "applicationcomments_count #{direction}"
      when "decision"
        "booth_granted #{direction}"
      when "last_updated"
        "updated_at #{direction}"
      when "red_spot"
        "red_spot #{direction}"
      else
        "years.year DESC, organisation_name"
      end
    end
    if params[:by_year]
      @year_scope = params[:by_year]
    end
    @applications = apply_scopes(Application).includes(:year).order(order).page(params[:page]).per(150)
    if params[:nomalongen] == "1"
      @nomalongen = true
    end
    if params[:shortversion] == "1"
      @shortversion = true
    end
  end



  def toggle_late
    @application = Application.find(params[:id])
    @application.toggle(:allow_late)
    @application.save
    redirect_to @application
  end

  def update
    update! { admin_applications_path }
  end

  def destroy
    destroy! { admin_applications_path }
  end

  protected

  def permitted_params
    params.permit(:application => [:booth_granted, :red_spot, :space_id, :year_id, :user_id, :accepted_terms, :organisation_name, :contact_first_name, :contact_last_name, :contact_email, :contact_phone, :contact_address1, :contact_address2, :contact_city, :contact_state, :contact_country,
      :contact_postcode, :form_direction, :exhibitor_address1, :exhibitor_address2,
      :organisation_description,  :exhibitor_city, :exhibitor_state, :exhibitor_country, :allow_late,
       :exhibitor_postcode, :hometown, :staff, :application_image, :apply_to_malongen, :malongen_use,
        :upload1, :upload2, :remove_upload1, :remove_upload2, :supermarket_proposal, :need_darker_room,
        :wants_open_structure, :booth_applied, :vat_number, :special_needs, :text_2019,
        space_attributes: [:exhibitors, :id, :exhibitionspacetype_id, :short_description, :logo, :website1, :website2],
        website_attributes: [:id, :url, :application_id],
        applicationlinks_attributes: [:id, :_destroy, :url, :title, :application_id],
        videolinks_attributes: [:id, :application_id, :_destroy, :video_provider, :title, :url],
        applicationwebimages_attributes: [:id, :application_id, :_destroy, :imagefile, :title, :sortorder]])
  end

end
