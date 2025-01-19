require "grape-swagger"

module API
  class Base < Grape::API
    prefix :api

    mount V1::Base
    mount V2::Base
    add_swagger_documentation(
      add_version: true,
      info: {
        title: "Grape Test"
      }
    )
  end
end
