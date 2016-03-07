class CreateStateCounts < ActiveRecord::Migration
  def change
    create_table :state_counts do |t|
      t.string :state
      t.string :county

      t.timestamps null: false
    end
  end
end
