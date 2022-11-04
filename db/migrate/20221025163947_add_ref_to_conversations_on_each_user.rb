class AddRefToConversationsOnEachUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :conversations, :sender_id, null: false, foreign_key: {to_table: :users}
    add_reference :conversations, :receiver_id, null: false, foreign_key: {to_table: :users}
  end
end
