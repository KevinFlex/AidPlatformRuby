class DropRequests < ActiveRecord::Migration[7.0]
  def change
    drop_table :requests do |t|
      t.string :title
      t.string :type
      t.float :lat
      t.float :long
      t.string :description
      t.boolean :isactive
      t.datetime :enddate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
