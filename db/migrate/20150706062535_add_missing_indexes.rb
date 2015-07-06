class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :articles, :user_id
    add_index :educations, :user_id
    add_index :experiences, :user_id
    add_index :technologies, :user_id
  end
end
