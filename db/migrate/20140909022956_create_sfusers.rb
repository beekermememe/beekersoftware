class CreateSfusers < ActiveRecord::Migration
  def change
    create_table :sfusers do |t|
      t.string :username
      t.text :details
      t.text :password
      t.timestamps
    end
  end
end
