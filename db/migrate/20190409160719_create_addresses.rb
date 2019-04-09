class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.timestamps

      t.string :type
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
    end
  end
end
