class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :actor_id
      t.integer :client_id

      t.timestamps
    end
  end
end
