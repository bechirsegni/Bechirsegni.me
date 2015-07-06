class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :title
      t.text :description
      t.string :university
      t.string :duration
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
