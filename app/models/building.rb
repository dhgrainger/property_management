class Building < ActiveRecord::Base
  belongs_to :owner

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true, format: { with: /\d\d\d\d\d/ }
end
