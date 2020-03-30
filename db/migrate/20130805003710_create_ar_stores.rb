class CreateArStores < ActiveRecord::Migration[6.0]

  def change
    create_table :ar_stores, id: :uuid do |t|
      t.binary :key, null: false
      t.binary :value, null: false

      t.index :key

      t.timestamps
    end
  end
end

