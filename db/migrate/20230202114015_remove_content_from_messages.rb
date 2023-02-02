class RemoveContentFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :content, :text
  end
end
