class AppSerializer
  include JSONAPI::Serializer
  attributes :organisation_name, :written_country, :exhibitor_full_address, :organisation_email, :contact_email
  attribute :logo do |app|
    app.space.logo? ? app.space.logo.url(:profile) : nil
  end

  attribute :websites do |app|
    app.websites
  end

  attribute :short_description do |app|
    app.text_2018.blank? ? app.space.short_description : app.text_2018
  end

  attribute :organisation_description 

  attribute :images do |app|
    app.applicationwebimages
  end

  attribute :links do |app|
    app.applicationlinks
  end
    
end
