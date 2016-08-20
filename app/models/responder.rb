class Responder < ActiveRecord::Base
  self.inheritance_column = nil
  validates :type, :name, :capacity, presence: true
  validates :name, uniqueness: true
  validates :capacity, inclusion: { in: 1..5 }
  after_initialize :set_defaults
  def as_json(opts = {})
    super(opts.merge(only: [:emergency_code, :type, :name, :capacity, :on_duty]))
  end

  private

  def set_defaults
    self.on_duty = false
  end
end
