class CreateAbsences < ActiveRecord::Migration[8.0]
  def change
    create_table :absences do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :duration, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
