class AddIsDeletedToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :is_deleted, :boolean, default: false
  end
end
