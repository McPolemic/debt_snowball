require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:transaction_one)
  end

  test "should get new" do
    get new_transaction_url(account_id: @transaction.account)
    assert_response :success
  end

  test "should create transaction" do
    transaction_params = {
      account_id: @transaction.account_id,
      amount: @transaction.amount_cents,
      charge_indicator: "payment",
      date: @transaction.date,
      description: @transaction.description
    }

    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: transaction_params }
    end

    assert_redirected_to account_url(@transaction.account)
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    transaction_params = {
      account_id: @transaction.account_id,
      amount: @transaction.amount_cents,
      new_balance: '0',
      date: @transaction.date,
      description: @transaction.description
    }
    patch transaction_url(@transaction), params: { transaction: transaction_params }
    assert_redirected_to account_url(@transaction.account)
  end

  test "should destroy transaction" do
    account = @transaction.account

    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to account_url(account)
  end
end
