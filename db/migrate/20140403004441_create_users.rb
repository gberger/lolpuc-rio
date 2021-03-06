class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :nickname
      t.string :email
      t.string :oauth_token, null: false
      t.string :oauth_token_expires_at, null: false
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
