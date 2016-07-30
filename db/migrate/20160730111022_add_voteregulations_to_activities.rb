class AddVoteregulationsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :namevoting, :boolean, :default => true
    add_column :activities, :locationvoting, :boolean, :default => true
    add_column :activities, :datevoting, :boolean, :default => true
    add_column :activities, :timevoting, :boolean, :default => true
    add_column :activities, :extravoting, :boolean, :default => true
  end
end
