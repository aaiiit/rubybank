class Account < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  
  # Manually add credits for this Account
  def add_credits(amount)
    self.balance += amount
  end
end
