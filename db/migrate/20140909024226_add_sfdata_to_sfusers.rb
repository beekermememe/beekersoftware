class AddSfdataToSfusers < ActiveRecord::Migration
  def change
    add_column :sfusers, :provider, :string
    add_column :sfusers, :uid, :string
    add_column :sfusers, :name, :string
  end
end
