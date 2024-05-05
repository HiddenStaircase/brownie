require "application_system_test_case"

class SearchFoodsTest < ApplicationSystemTestCase
  test "Search retrieves list of foods" do
    visit foods_search_index_path

    assert_selector "li", text: "Oat Milk"

    fill_in "search_term", with: "Soy"
    click_on "Search"

    assert_selector "li", text: "Soy Milk"
  end

  test "Search requires presence of search term" do
    visit foods_search_index_path

    click_on "Search"

    assert_content "Please fill out this field."
  end
end
