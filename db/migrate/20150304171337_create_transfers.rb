class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :sender_account_id
      t.integer :receiver_account_id
      t.integer :amount

      t.timestamps
    end
  end
end
