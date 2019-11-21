class EmployerProfile < ApplicationRecord
  belongs_to :employer

  has_one_attached :avatar
end
