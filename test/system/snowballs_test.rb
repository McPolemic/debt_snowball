require "application_system_test_case"

class SnowballsTest < ApplicationSystemTestCase
  setup do
    @snowball = snowballs(:one)
  end

  test "visiting the index" do
    visit snowballs_url
    assert_selector "h1", text: "Snowballs"
  end

  test "creating a Snowball" do
    visit snowballs_url
    click_on "New Snowball"

    fill_in "Name", with: @snowball.name
    click_on "Create Snowball"

    assert_text "Snowball was successfully created"
    click_on "Back"
  end

  test "updating a Snowball" do
    visit snowballs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @snowball.name
    click_on "Update Snowball"

    assert_text "Snowball was successfully updated"
    click_on "Back"
  end

  test "destroying a Snowball" do
    visit snowballs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Snowball was successfully destroyed"
  end
end
