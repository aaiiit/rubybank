class CreateAccountLines < ActiveRecord::Migration
  def change
    create_table :account_lines do |t|
      t.integer :transfer_id
      t.integer :account_id
      t.integer :amount

      t.timestamps
    end
  end
end
