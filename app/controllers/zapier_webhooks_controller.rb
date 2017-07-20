class ZapierWebhooksController < ApplicationController
  before_action :check_auth
  skip_before_action :verify_authenticity_token 

  def recieve
      
  end

  def check_auth
   authenticate_or_request_with_http_basic do |username,password|
     resource =User.find_by_email(username)
     if resource.valid_password?(password)
       sign_in :user, resource
     end
   end

  end
end
