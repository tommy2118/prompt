class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :username
      t.string :name
      t.string :url
      t.string :image_url
      t.string :token
      t.string :refresh_token
      add_index :users, :provider
      add_index :users, :uid
      add_index :users, [:provider, :uid], unique: true

      t.timestamps
    end
  end
end
