require "grape-swagger"

module V2
  class Base < Grape::API
    version "v2", using: :path, vendor: "codebunnies", cascade: true

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

    mount V2::Bundles::API
    add_swagger_documentation(
      info: {
        title: "Grape Test",
      },
      mount_path: "/swagger",
      doc_version: "v2.0.0"
    )
  end
end
