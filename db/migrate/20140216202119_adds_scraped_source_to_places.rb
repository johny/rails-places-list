class AddsScrapedSourceToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :source, :string
  end
end
