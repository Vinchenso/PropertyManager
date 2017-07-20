class ZapierWebhooksController < ApplicationController
  before_action :check_auth
  skip_before_action :verify_authenticity_token

  def recieve
    bank_account = BankAccount.find_by(zapier_index: webhook_params['COL$I'])
    bank_account.nil? ? create_bank_account_and_balance : create_account_balance(bank_account)

    if @accountBalance.save
      head :no_content
    else
      render json: accountBalance.errors, status: :unprocessable_entity
    end
  end

  private

  def check_auth
    authenticate_or_request_with_http_basic do |username,password|
      resource = User.find_by_email(username)
      if resource.valid_password?(password)
        sign_in :user, resource
      end
    end
  end

  def webhook_params
    params.require(:zapier_webhook).permit('row', 'COL$F' , 'COL$A', 'COL$B', 'COL$C', 'COL$D', 'COL$E', 'COL$F', 'COL$G', 'COL$H', 'COL$I')
  end

  def create_account_balance (linked_bank_account)
    @accountBalance = AccountBalance.new(
      spreadsheetRow: webhook_params['row'],
      # uploadedTime: webhook_params[:
      uploadedDate: webhook_params['COL$A'],
      amount: webhook_params['COL$F'].sub('$','').to_i,
      bank_account_id: linked_bank_account.id)
  end

  def create_bank_account_and_balance
    new_bank_account = BankAccount.new(
      name: webhook_params['COL$C'],
      institution: webhook_params['COL$E'],
      account_type: webhook_params['COL$G'],
      account_klass: webhook_params['COL$H'],
      zapier_index: webhook_params['COL$I'],
      account_number: webhook_params['COL$D'])

    create_account_balance(new_bank_account) if new_bank_account.save
  end

end
