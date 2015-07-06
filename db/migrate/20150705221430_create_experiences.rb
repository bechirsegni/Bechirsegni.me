class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :duration
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
