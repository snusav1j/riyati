class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.string :role
      t.integer :coin_id
      t.float :balance
      t.string :firstname
      t.string :lastname
      t.timestamps
    end
  end
end
