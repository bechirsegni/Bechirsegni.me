class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
