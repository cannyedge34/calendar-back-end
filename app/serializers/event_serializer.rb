class EventSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :description
  attribute :start_date, key: :start
  attribute :end_date, key: :end
end
