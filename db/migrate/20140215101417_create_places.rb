class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :street_address
      t.string :zipcode
      t.belongs_to :city
      t.string :phone
      t.string :website
      t.string :email
      t.string :workflow_state

      t.timestamps
    end

    add_index :places, :slug, unique: true
    add_index :places, :workflow_state, unique: false

  end
end
