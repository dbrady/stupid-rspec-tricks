class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :age, presence: true
  validates :age, numericality: true

  def full_name
    "#{first_name && first_name.strip.capitalize} #{last_name && last_name.strip.capitalize}".strip
  end
end
