class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.date :birthday
      t.references :user, index: true

      t.timestamps
    end
  end
end
