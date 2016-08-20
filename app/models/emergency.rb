class Emergency < ActiveRecord::Base
  validates :police_severity, :medical_severity, :fire_severity, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :code, uniqueness: true, presence: true
end
