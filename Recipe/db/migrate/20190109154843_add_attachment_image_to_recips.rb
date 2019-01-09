class AddAttachmentImageToRecips < ActiveRecord::Migration[5.2]
  def self.up
    change_table :recips do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :recips, :image
  end
end
