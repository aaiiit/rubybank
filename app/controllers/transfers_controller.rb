class TransfersController < ApplicationController
  before_action :require_user
  before_action :set_transfer, only: [:show]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.sender_account = current_user.account

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer.sender_account, notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:receiver_account_id, :amount)
    end
end
