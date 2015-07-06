class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :skill
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
