class AddAttachmentAvatarToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :instructors, :avatar
  end
end
