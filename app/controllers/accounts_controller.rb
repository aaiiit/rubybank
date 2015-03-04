class AccountsController < ApplicationController
  before_action :set_account, only: [:show]
  before_action :require_user

  def show
  end

  private
  def set_account
    @account = Account.find(params[:id])
  end
end
