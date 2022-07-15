class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length:{minimum:6}, length:{maximum:12}, confirmation: true, on: :create
end
