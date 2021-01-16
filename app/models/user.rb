class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create_commit :send_credential

  def doner?
    type == 'Doner'
  end
  def super_admin?
    type == 'SuperAdmin'
  end

  def send_credential
    # Here goes email for this user for this need sendGrid service credential
    # return if Rails.env.development?
    # UserMailer.user_welcome(self).deliver
  end
end
