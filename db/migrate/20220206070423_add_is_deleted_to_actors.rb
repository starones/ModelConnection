class AddIsDeletedToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :is_deleted, :boolean, default: false
  end
end
