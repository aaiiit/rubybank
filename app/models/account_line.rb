class AccountLine < ActiveRecord::Base
  belongs_to :transfer
  belongs_to :account

  validates :account_id, presence: true

  scope :manual, -> { where(transfer_id: nil) }
  scope :transferred, -> { where(transfer_id: !nil) }
end
