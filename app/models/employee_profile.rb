class EmployeeProfile < ApplicationRecord
  belongs_to :employee
  belongs_to :profession
end
