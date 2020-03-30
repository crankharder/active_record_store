class AddExpirationFlag < ActiveRecord::Migration[6.0]

  def change
    add_column :ar_stores, :expires, :boolean, :default => false
  end
end

