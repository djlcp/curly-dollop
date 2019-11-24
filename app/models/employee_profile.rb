class EmployeeProfile < ApplicationRecord
  belongs_to :employee
  has_one :profession

  has_one_attached :avatar
end
