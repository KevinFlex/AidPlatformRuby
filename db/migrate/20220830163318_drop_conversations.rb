class DropConversations < ActiveRecord::Migration[7.0]
  def change
    drop_table :conversations
  end
end
