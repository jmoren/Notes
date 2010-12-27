# == Schema Info
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  current_sign_in_ip   :string(255)
#  email                :string(255)     not null, default("")
#  encrypted_password   :string(128)     not null, default("")
#  last_sign_in_ip      :string(255)
#  password_salt        :string(255)     not null, default("")
#  remember_token       :string(255)
#  reset_password_token :string(255)
#  sign_in_count        :integer(4)      default(0)
#  created_at           :datetime
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  remember_created_at  :datetime
#  updated_at           :datetime

class User < ActiveRecord::Base
  has_many :notas
  has_many :comments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,
#         :ldap_authenticatable,
         :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :notas
  has_many :comments
  has_many :votes
end

