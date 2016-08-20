class Responder < ActiveRecord::Base
  validates :type, :name, :capacity, presence: true
  validates :capacity, inclusion: { in: 1..5 }
end
