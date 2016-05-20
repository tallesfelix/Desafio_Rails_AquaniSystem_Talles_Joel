class AddIdadeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :idade, :integer
  end
end
