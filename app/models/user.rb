class User < ActiveRecord::Base
  validates :email, presence: true, email: true, uniqueness: true

  has_many :todos
end
