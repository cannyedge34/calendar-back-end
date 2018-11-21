# attributes to be serialized
class EventSerializer < ActiveModel::Serializer
  attributes :title, :description
  attribute :start_date, key: :start
  attribute :end_date, key: :end
end
