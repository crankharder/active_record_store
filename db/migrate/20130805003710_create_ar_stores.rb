class CreateArStores < ActiveRecord::Migration

  def change
    create_table :ar_stores do |t|
      t.text :key, null: false
      t.text :value, null: false

      t.index :key

      t.datetime :updated_at, null: false
    end
  end
end

