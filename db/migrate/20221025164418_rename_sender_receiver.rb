class RenameSenderReceiver < ActiveRecord::Migration[7.0]
  def change
    remove_column :conversations, :sender_id_id
    remove_column :conversations, :receiver_id_id
    remove_column :conversations, :sender_id
    remove_column :conversations, :receiver_id

    add_reference :conversations, :sender, null: false, foreign_key: {to_table: :users}
    add_reference :conversations, :receiver, null: false, foreign_key: {to_table: :users}
  end
end
