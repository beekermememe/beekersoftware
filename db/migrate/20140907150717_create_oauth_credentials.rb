class CreateOauthCredentials < ActiveRecord::Migration
  def change
    create_table :oauth_credentials do |t|
      t.date :issued_at
      t.string :refresh_token
      t.string :instance_url
      t.string :access_token
      t.string :signature

      t.timestamps
    end
  end
end
