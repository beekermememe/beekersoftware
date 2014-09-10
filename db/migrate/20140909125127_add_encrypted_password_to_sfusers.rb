class AddEncryptedPasswordToSfusers < ActiveRecord::Migration
  def change
    add_column :sfusers, :encrypted_password, :string, null: false, default: ""
  end
end
