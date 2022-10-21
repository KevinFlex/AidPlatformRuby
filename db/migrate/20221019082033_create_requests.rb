class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :description
      t.string :type
      t.float :lat
      t.float :long
      t.boolean :isactive
      t.timestamp :endate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
