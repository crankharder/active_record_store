class AddExpirationFlag < ActiveRecord::Migration

  def change
    add_column :ar_stores, :expires, :boolean, :default => false
  end
end

