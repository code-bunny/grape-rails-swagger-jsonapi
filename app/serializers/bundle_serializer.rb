class BundleSerializer < BaseSerializer
  include JSONAPI::Serializer
  attributes :title
end
