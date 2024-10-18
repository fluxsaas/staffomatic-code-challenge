class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :payroll_enabled, default: false
      t.integer :target_duration_per_month, default: 0

      t.timestamps
    end
  end
end
