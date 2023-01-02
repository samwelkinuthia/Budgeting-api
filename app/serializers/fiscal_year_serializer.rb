class FiscalYearSerializer < ActiveModel::Serializer
  attributes :id, :date_from, :date_to, :name
end
