class ChangeEndateAndIsactiveAsDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column :requests, :isactive, :boolean, default: true
  end
end
