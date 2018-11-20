class EventSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :description, :start_date, :end_date
end
