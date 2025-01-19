require "grape-swagger"

module V1
  class Base < Grape::API
    mount V1::Bundles::API
    add_swagger_documentation add_version: true, api_version: "v2"
  end
end
