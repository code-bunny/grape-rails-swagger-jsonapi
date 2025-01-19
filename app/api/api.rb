require "grape-swagger"

module API
  class Root < Grape::API
    prefix :api

    mount Bundles::API
    add_swagger_documentation
  end
end
