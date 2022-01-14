class AddImpressionsCountToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :impressions_count, :integer, default: 0
  end
end
