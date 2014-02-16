class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :slug
      t.string :workflow_state
      t.timestamps
    end

    add_index :cities, :slug, unique: true
    add_index :cities, :workflow_state, unique: false

  end
end
