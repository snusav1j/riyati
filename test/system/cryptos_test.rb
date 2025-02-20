require "application_system_test_case"

class CryptosTest < ApplicationSystemTestCase
  setup do
    @crypto = cryptos(:one)
  end

  test "visiting the index" do
    visit cryptos_url
    assert_selector "h1", text: "Cryptos"
  end

  test "should create crypto" do
    visit cryptos_url
    click_on "New crypto"

    click_on "Create Crypto"

    assert_text "Crypto was successfully created"
    click_on "Back"
  end

  test "should update Crypto" do
    visit crypto_url(@crypto)
    click_on "Edit this crypto", match: :first

    click_on "Update Crypto"

    assert_text "Crypto was successfully updated"
    click_on "Back"
  end

  test "should destroy Crypto" do
    visit crypto_url(@crypto)
    click_on "Destroy this crypto", match: :first

    assert_text "Crypto was successfully deleted"
  end
end
