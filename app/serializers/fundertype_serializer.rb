class FundertypeSerializer
  include JSONAPI::Serializer
  attributes :name, :sort_order
end
