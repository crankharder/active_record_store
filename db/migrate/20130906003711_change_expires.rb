class ChangeExpires < ActiveRecord::Migration[6.0]

  def change
    remove_column :ar_stores, :expires
    add_column :ar_stores, :expires, :integer
  end
end

