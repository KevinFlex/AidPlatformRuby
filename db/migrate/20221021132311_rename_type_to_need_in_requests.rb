class RenameTypeToNeedInRequests < ActiveRecord::Migration[7.0]
  def up
    rename_column :requests, :type, :need
  end

end
