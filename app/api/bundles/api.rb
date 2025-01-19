module Bundles
  class API < Grape::API
    version "v1", using: :header, vendor: "codebunnies"

    content_type :jsonapi, "application/vnd.api+json"
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    format :jsonapi

    resources :bundles do
      desc "All Bundles" do
        success BundleSerializer
      end
      get do
        render Bundle.all.to_a
      end

      desc "Create a Bundle" do
        success BundleSerializer
      end
      params do
        requires :data, type: Hash do
          requires :attributes, type: Hash do
            optional :title, type: String
          end
        end
      end
      post do
        bundle = Bundle.new(declared(params))

        if bundle.save
          render bundle
        else
          status 422
          # JSON API ERROR HERE
        end
      end

      route_param :id do
        desc "Find a Bundle by :id" do
          success BundleSerializer
        end
        get do
          render Bundle.find(params[:id])
        end

        desc "Update a Bundle" do
          success BundleSerializer
        end
        params do
          requires :data, type: Hash do
            requires :attributes, type: Hash do
              optional :title, type: String
            end
          end
        end
        patch do
          bundle = Bundle.find(params[:id])

          if bundle.update(declared(params))
            render bundle
          else
            status 422
            # JSON API ERROR HERE
          end
        end

        desc "Delete a Bundle" do
          success code: 204, model: BundleSerializer, message: "Delete a Bundle"
        end
        delete do
          bundle = Bundle.find(params[:id])
          bundle.delete
        end
      end
    end
  end
end
