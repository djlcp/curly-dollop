class EmployeeProfile < ApplicationRecord
  belongs_to :employee
  belongs_to :profession
  validates :profession_id, presence: true
  
  has_many :comments
  has_one_attached :avatar
end
