class User < ActiveRecord::Base
  acts_as_authentic
  has_one :account

  after_create :create_account

  protected
  def create_account
    puts "BUILDING ACCOUNT!!!!!!!!!!!!!"
    self.account = Account.create
    self.save
  end
end
