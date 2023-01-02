class Department < ApplicationRecord
  belongs_to :county
  has_many :projects

  validates :name, presence: true, uniqueness: { scope: :county_id }
end
