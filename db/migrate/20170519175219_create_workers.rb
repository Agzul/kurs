class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :sn,       null: false
      t.string :fn,       null: false
      t.string :ln,       null: false
      t.string :passport, null: false, unique: true
      t.string :inn,      null: false, unique: true
      t.date :birthday,   null: false
      t.string :position, null: false
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
