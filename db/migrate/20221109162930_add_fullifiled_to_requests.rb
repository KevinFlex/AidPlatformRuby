class AddFullifiledToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :fullifiled, :boolean, default: false
  end
end
