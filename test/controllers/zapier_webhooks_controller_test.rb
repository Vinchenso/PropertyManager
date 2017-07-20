require 'test_helper'

class ZapierWebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get recieve" do
    get zapier_webhooks_recieve_url
    assert_response :success
  end

end
