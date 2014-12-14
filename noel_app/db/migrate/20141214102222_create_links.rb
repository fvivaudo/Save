class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :item, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
