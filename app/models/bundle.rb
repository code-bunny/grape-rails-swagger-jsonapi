class Bundle < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "title", "updated_at", "created_at" ]
  end
end
