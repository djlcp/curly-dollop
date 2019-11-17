class EmployeeProfile < ApplicationRecord
  belongs_to :employee
  belongs_to :profession

  has_one_attached :avatar
end
