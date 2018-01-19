class ChangeGeocodeColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :latitude, :decimal, :precision => 15, :scale => 13
    remove_column :events, :longitude, :decimal, :precision => 15, :scale => 13
    remove_column :organizations, :latitude, :decimal, :precision => 15, :scale => 13
    remove_column :organizations, :longitude, :decimal, :precision => 15, :scale => 13
    add_column :events, :latitude, :float 
    add_column :events, :longitude, :float 
    add_column :organizations, :latitude, :float 
    add_column :organizations, :longitude, :float 
  end
end
