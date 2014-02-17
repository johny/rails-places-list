class AddAdjectiveToCities < ActiveRecord::Migration
  def change
    add_column :cities, :adjective, :string
  end
end
