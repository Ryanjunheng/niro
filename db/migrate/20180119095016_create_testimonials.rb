class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.integer :visitor_id
      t.string :title
      t.text :testimony
      t.timestamps
    end
  end
end
