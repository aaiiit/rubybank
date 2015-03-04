class Account < ActiveRecord::Base
  belongs_to :user
  has_many :lines, class_name: 'AccountLine'

  validates :user_id, presence: true
  
  # Manually add credits for this Account
  def add_credits(amount)
    self.lines.create(amount: amount)
    self.balance += amount 
  end
end
