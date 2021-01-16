class Doner < User
  validates :first_name, :phone, presence: true
end
