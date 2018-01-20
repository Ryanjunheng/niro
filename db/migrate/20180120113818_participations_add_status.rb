class ParticipationsAddStatus < ActiveRecord::Migration[5.1]
  def change
  add_column :participations, :status, :integer, default: 0
  end
end
