class CreateWorkerProjects < ActiveRecord::Migration
  def change
    create_table :worker_projects do |t|
      t.references :worker,  index: true, foreign_key: true, null: false
      t.references :project, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
