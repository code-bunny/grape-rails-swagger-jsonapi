require "grape-swagger"

module V1
  class Base < Grape::API
    version "v1", using: :path, vendor: "codebunnies"

    helpers JSONAPI::Pagination, JSONAPI::Filtering

    Error = Struct.new(:id)

    rescue_from ActiveRecord::RecordNotFound do
      error!({
        errors: [
          {
            status: "404",
            title: "Resource Not Found"
          }
        ]
      }, 404)
    end

    mount V1::Bundles::API
    add_swagger_documentation(
      info: {
        title: "Grape Test",
      },
      mount_path: "/swagger",
      doc_version: "v1.0.0"
    )
  end
end
