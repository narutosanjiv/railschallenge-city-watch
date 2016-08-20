class AddResolvedAtToEmergency < ActiveRecord::Migration
  def change
    add_column :emergencies, :resolved_at, :DateTime
  end
end
