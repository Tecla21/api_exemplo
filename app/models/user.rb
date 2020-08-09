class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum roles_masks: {:admin => 0, :other => 1}
  # validates :first_name, presence: true
  # validates :last_name, presence: true

end
