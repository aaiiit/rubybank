class AccountLine < ActiveRecord::Base
  belongs_to :transact, class_name: 'Transaction'
  belongs_to :account

  validates :account_id, presence: true
end
