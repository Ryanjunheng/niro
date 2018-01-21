class CreateReportings < ActiveRecord::Migration[5.1]
  def change
    create_table :reportings do |t|
      t.integer :reporter_id
      t.references :reported, polymorphic: true, index: true
      t.text :comment
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
