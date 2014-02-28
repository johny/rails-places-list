class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|

      t.references :place

      t.string :name
      t.text :description
      t.text :comments

      t.string :street_address
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
