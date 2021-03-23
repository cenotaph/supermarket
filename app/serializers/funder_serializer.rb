class FunderSerializer
  include JSONAPI::Serializer
  attributes :name, :url

  attribute :logo do |obj|
    obj.logo? ? obj.logo.url : nil
  end
  attribute :years do |obj|
    obj.years.map(&:year)
  end

  belongs_to :fundertype
end
