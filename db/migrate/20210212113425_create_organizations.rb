class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
