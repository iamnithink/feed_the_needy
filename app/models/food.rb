class Food < ApplicationRecord
  belongs_to :user
  validates :name, :phone, :address, :description, :number_of_plate, presence: true
end
