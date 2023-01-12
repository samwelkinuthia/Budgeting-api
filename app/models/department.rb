class Department < ApplicationRecord
  belongs_to :county, :counter_cache => :projects_count
  has_many :projects
  has_many :users
  scope :with_juice, -> { where("juice > 0") }
  validates :name, presence: true, uniqueness: { scope: :county_id }
end
