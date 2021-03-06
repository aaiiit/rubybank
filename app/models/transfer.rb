class Transfer < ActiveRecord::Base
  belongs_to :sender_account, class_name: 'Account'
  belongs_to :receiver_account, class_name: 'Account'

  has_many :account_lines

  validates :sender_account_id, presence: true
  validates :receiver_account_id, presence: true
  validates :amount, presence: true

  after_create :process!

  private
  def process!
    raise NegativeAmountException if self.amount < 0
    sender_account.withdraw! self,amount
    receiver_account.deposit! self,amount
  end

  class NegativeAmountException < StandardError
  end
end
