require "grape-swagger"

module V2
  class Base < Grape::API
    mount V2::Bundles::API
    add_swagger_documentation add_version: true, api_version: "v2"
  end
end
