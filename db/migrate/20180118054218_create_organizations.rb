class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|

      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :registration_number
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.integer :verification, default: 0
      t.json :logo
      t.json :documents


      t.timestamps
    end
  end
end
