require 'test_helper'

class SnowballsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snowball = snowballs(:one)
  end

  test "should get index" do
    get snowballs_url
    assert_response :success
  end

  test "should get new" do
    get new_snowball_url
    assert_response :success
  end

  test "should create snowball" do
    assert_difference('Snowball.count') do
      post snowballs_url, params: { snowball: { name: @snowball.name } }
    end

    assert_redirected_to snowball_url(Snowball.last)
  end

  test "should show snowball" do
    get snowball_url(@snowball)
    assert_response :success
  end

  test "should get edit" do
    get edit_snowball_url(@snowball)
    assert_response :success
  end

  test "should update snowball" do
    patch snowball_url(@snowball), params: { snowball: { name: @snowball.name } }
    assert_redirected_to snowball_url(@snowball)
  end

  test "should destroy snowball" do
    assert_difference('Snowball.count', -1) do
      delete snowball_url(@snowball)
    end

    assert_redirected_to snowballs_url
  end
end
