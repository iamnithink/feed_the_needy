class Food < ApplicationRecord
  belongs_to :user
  validates :name, :phone, :address, :description, presence: true
end
