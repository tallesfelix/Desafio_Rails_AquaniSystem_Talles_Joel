class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.float :value
      t.text :description

      t.timestamps null: false
    end
  end
end
