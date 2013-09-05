class ChangeExpires < ActiveRecord::Migration

  def change
    remove_column :ar_stores, :expires
    add_column :ar_stores, :expires, :integer
  end
end

