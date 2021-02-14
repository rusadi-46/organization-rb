class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :organization_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :avatar

      t.timestamps
    end
  end
end
