class County < ApplicationRecord
  validates :name, presence: {message: 'The name must be present'}
  validates :code, presence:{message: 'The code must be present'}, uniqueness: {message: 'County with code %(value) already exists!'}
end
