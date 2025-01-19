require "grape-swagger"

module API
  class Base < Grape::API
    prefix :api

    mount V2::Base
    mount V1::Base
  end
end
