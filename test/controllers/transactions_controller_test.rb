require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    snowball = snowballs(:one)
    @account = Account.create!(snowball: snowball)
    @transaction = transactions(:transaction_one)
  end

  test "should get new" do
    get new_transaction_url(account_id: @transaction.account)
    assert_response :success
  end

  test "setting a new balance creates a transaction equivalent to the new balance" do
    transaction_params = {
      account_id: @account.id,
      new_balance: "$15,000",
      date: Date.today.iso8601,
      description: "Setting new balance"
    }

    post transactions_url, params: { transaction: transaction_params }

    transaction = Transaction.last

    assert_equal transaction.account.current_balance, 15000_00
    assert_redirected_to account_url(@account)
  end

  test "should create transaction with a charge" do
    transaction_params = {
      account_id: @transaction.account_id,
      amount: "$10",
      charge_indicator: "charge",
      date: @transaction.date,
      description: "Sample charge"
    }

    post transactions_url, params: { transaction: transaction_params }

    assert_equal Transaction.last.amount_cents, 10_00
  end

  test "should create transaction with a payment" do
    transaction_params = {
      account_id: @transaction.account_id,
      amount: "$15",
      new_balance: "",
      charge_indicator: "payment",
      date: @transaction.date,
      description: "Sample payment"
    }

    post transactions_url, params: { transaction: transaction_params }

    assert_equal Transaction.last.amount_cents, -15_00
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
