class Emergency < ActiveRecord::Base
  self.primary_key = 'code'
  validates :police_severity, :medical_severity, :fire_severity, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :code, uniqueness: true, presence: true



  def as_json(options = {})
    super(options.merge(only: [:code, :police_severity, :medical_severity, :fire_severity, :resolved_at]))
  end
end
