class AccountLine < ActiveRecord::Base
  belongs_to :transact, class_name: 'Transaction'
  belongs_to :account

  validates :account_id, presence: true

  scope :manual, -> { where(transaction_id: nil) }
  scope :transacted, -> { where(transaction_id: !nil) }

  # Returns the correct amount so we can audit
  def amount_for_user(user)
    puts self.inspect
    if self.transact
      0
    else
      amount
    end
  end
end
