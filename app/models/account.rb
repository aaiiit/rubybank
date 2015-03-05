class Account < ActiveRecord::Base
  belongs_to :user
  has_many :lines, class_name: 'AccountLine'
  has_many :transfers, through: :lines, class_name: 'Transfer', source: 'transact'

  validates :user_id, presence: true
  
  # Manually add credit for this Account
  def add_credit(amount)
    raise Transfer::NegativeAmountException if(amount < 0)
    self.lines.create(amount: self.balance + amount)
    self.balance += amount
  end

  def deposit!(tx,amount)
    lines.create(transfer_id: tx.id,account_id: self.id,amount: amount)
    self.update_attribute(:balance,self.balance + amount)
  end

  def withdraw!(tx,amount)
    raise BalanceExceededException if(amount > balance)
    self.lines.create(transfer_id: tx.id,account_id: self.id,amount: amount)
    self.update_attribute(:balance,self.balance - amount)
  end


  class BalanceExceededException < StandardError
  end
end
