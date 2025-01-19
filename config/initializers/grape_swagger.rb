require File.join(Rails.root, "app/serializers/base_serializer")

GrapeSwagger.model_parsers.register(GrapeSwagger::Jsonapi::Parser, BaseSerializer)
