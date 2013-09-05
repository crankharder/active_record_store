class AddIndices < ActiveRecord::Migration

  def change
    change_column :ar_stores, :expires, :integer
  end
end

