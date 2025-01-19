require "grape-swagger"

module API
  class Root < Grape::API
    prefix :api

    mount Bundles::API
    add_swagger_documentation(
      info: {
        title: "Grape Test."
      }
    )
  end
end
