class OrganizationsRemoveFk < ActiveRecord::Migration[5.1]
  def change
    remove_belongs_to :organizations, :user
  end
end
