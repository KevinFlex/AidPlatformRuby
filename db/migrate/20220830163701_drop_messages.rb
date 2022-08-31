class DropMessages < ActiveRecord::Migration[7.0]
    def up
      drop_table :messages
    end
  
    def down
      fail ActiveRecord::IrreversibleMigration
    end
end
