class Department < ApplicationRecord
  belongs_to :county
  has_many :projects
  scope :with_juice, -> { where("juice > 0") }
  validates :name, presence: true, uniqueness: { scope: :county_id }
end
