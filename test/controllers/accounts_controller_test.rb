require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:account_one)
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    account_params = {
      name: @account.name,
      snowball_id: @account.snowball_id,
      amount_owed: "4000"
    }

    assert_difference('Account.count') do
      post accounts_url, params: { account: account_params }
    end

    new_account = Account.last

    assert_redirected_to account_url(new_account)
    assert_equal new_account.transactions.first.amount_cents, 4000_00
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    account_params = {
      name: @account.name,
      snowball_id: @account.snowball_id
    }

    patch account_url(@account), params: { account: account_params }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    snowball = @account.snowball

    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to snowball_url(snowball)
  end
end
