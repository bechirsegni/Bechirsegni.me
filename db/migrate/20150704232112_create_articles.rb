class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :duration
      t.text :description

      t.timestamps null: false
    end
  end
end
