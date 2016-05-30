class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :nome, :name
  end
end
