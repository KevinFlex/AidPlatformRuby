class AddRequestReferenceToConversations < ActiveRecord::Migration[7.0]
  def change
    add_reference :conversations, :request, null: false, foreign_key: {to_table: :request}
  end
end

