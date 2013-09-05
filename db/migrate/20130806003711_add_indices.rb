class AddIndices < ActiveRecord::Migration

  def change
    add_index :ar_stores, :updated_at
  end
end

