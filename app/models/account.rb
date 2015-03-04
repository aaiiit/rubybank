class Account < ActiveRecord::Base
  belongs_to :user
  has_many :lines, class_name: 'AccountLine'

  validates :user_id, presence: true
  
  # Manually add credits for this Account
  def add_credits(amount)
    self.lines.create(amount: amount)
    self.update_attribute(:balance,self.balance + amount)
  end

  def deposit!(tx,amount)
    lines.create(transaction_id: tx.id,account_id: self.id,amount: amount)
    self.update_attribute(:balance,self.balance + amount)
  end

  def withdraw!(tx,amount)
    self.lines.create(transaction_id: tx.id,account_id: self.id,amount: amount)
    self.update_attribute(:balance,self.balance - amount)
  end
end
