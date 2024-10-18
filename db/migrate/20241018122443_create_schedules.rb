class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.date :month
      t.integer :assigned_duration_per_month, default: 0

      t.timestamps
    end
  end
end
