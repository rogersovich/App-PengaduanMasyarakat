require "application_system_test_case"

class SocietiesTest < ApplicationSystemTestCase
  setup do
    @society = societies(:one)
  end

  test "visiting the index" do
    visit societies_url
    assert_selector "h1", text: "Societies"
  end

  test "creating a Society" do
    visit societies_url
    click_on "New Society"

    fill_in "Name", with: @society.name
    fill_in "Password", with: @society.password
    fill_in "Telp", with: @society.telp
    fill_in "Username", with: @society.username
    click_on "Create Society"

    assert_text "Society was successfully created"
    click_on "Back"
  end

  test "updating a Society" do
    visit societies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @society.name
    fill_in "Password", with: @society.password
    fill_in "Telp", with: @society.telp
    fill_in "Username", with: @society.username
    click_on "Update Society"

    assert_text "Society was successfully updated"
    click_on "Back"
  end

  test "destroying a Society" do
    visit societies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Society was successfully destroyed"
  end
end
