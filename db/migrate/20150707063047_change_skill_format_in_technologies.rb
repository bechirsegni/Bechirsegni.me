class ChangeSkillFormatInTechnologies < ActiveRecord::Migration
  def change
    change_column :technologies, :skill, :text
  end
end
