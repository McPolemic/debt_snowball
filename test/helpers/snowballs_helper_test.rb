require 'test_helper'

class SnowballsHelperTest < ActionView::TestCase
  test "remaining_duration will show one month when total is less than monthly amount" do
    assert_equal remaining_duration(1_00, 1500_00), "1 month"
  end

  test "remaining_duration will show one month when everything is paid exactly" do
    assert_equal remaining_duration(1500_00, 1500_00), "1 month"
  end

  test "remaining_duration will round up a month if there's a partial payment" do
    assert_equal remaining_duration(1501_00, 1500_00), "2 months"
  end

  test "remaining_duration will show years and months if it takes over one year" do
    assert_equal remaining_duration(1300_00, 100_00), "1 year, 1 month"
  end
end
