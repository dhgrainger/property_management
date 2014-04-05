class Owner < ActiveRecord::Base
  has_many :buildings, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  def full_name
    "#{first_name} #{last_name}"
  end
end
