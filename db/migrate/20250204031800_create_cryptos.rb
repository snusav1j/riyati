class CreateCryptos < ActiveRecord::Migration[8.0]
  def change
    create_table :user_coins do |t|
      t.string :user_id
      t.string :crypto_symbol
      t.integer :crypto_buy_price
      t.integer :crypto_sold_price
      t.timestamps
    end
  end
end
