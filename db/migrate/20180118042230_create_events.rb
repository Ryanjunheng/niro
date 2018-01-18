class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.reference :user_id, foreign_key: true, on_delete: :cascade, null: true
      t.reference :organization_id, foreign_key: true, on_delete: :cascade, null: true 
      t.string :name
      t.string :description
      t.string :event_type
      t.string :status
      t.integer :report_count
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.json :photos
      t.timestamps
    end
  end
end
