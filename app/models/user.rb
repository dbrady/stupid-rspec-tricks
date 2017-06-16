class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :age, presence: true
  validates :age, numericality: true
end
