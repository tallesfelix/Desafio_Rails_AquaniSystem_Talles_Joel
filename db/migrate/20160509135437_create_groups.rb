class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :schedule
      t.string :teacher
      t.text :obs

      t.timestamps null: false
    end
  end
end
