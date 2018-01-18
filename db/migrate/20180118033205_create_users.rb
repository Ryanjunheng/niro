class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: true
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      t.string :full_name
      t.string :phone
      t.text :intro
      t.integer :level
      t.integer :points
      t.integer :verification, default: 0
      t.string :city
      t.string :state
      t.string :country
      t.string :fb_link
      t.string :linkedin_link
      t.string :twitter_link
      t.integer :role, default: 0
      t.json :avatar
      t.json :documents
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
