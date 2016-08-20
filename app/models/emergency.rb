class Emergency < ActiveRecord::Base
  validates :police_severity, :medical_severity, :fire_severity, presence: true, numericality: true
  validates :code, uniqueness: true
end
