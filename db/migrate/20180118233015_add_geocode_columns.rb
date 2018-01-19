class AddGeocodeColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :events, :longitude, :decimal, :precision => 15, :scale => 13
    add_column :organizations, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :organizations, :longitude, :decimal, :precision => 15, :scale => 13
  end
end
