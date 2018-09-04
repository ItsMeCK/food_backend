class AddAttachmentProfilePictureToParents < ActiveRecord::Migration[5.0]
  def self.up
    change_table :parents do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :parents, :profile_picture
  end
end
