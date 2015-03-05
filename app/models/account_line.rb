class AccountLine < ActiveRecord::Base
  belongs_to :transact, class_name: 'Transfer'
  belongs_to :account

  validates :account_id, presence: true

  scope :manual, -> { where(transfer_id: nil) }
  scope :transacted, -> { where(transfer_id: !nil) }

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
