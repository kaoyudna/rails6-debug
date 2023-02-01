class RemoveFollwerIdFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :follwer_id, :integer
  end
end
