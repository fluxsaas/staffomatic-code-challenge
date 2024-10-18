class CreatePayrolls < ActiveRecord::Migration[8.0]
  def change
    create_table :payrolls do |t|
      t.references :user, null: false, foreign_key: true
      t.date :month
      t.integer :target_duration_per_month, default: 0
      t.integer :assigned_duration_per_month, default: 0

      t.timestamps
    end
  end
end
