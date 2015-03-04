class User < ActiveRecord::Base
  acts_as_authentic
  has_one :account

  after_create :create_account

  private
  def create_account
    self.account = Account.create
    self.save
  end
end
