class AddAttachmentLogoToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :projects, :logo
  end
end
