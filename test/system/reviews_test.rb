require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Created at", with: @review.created_at
    fill_in "Description", with: @review.description
    fill_in "Title", with: @review.title
    fill_in "Updated at", with: @review.updated_at
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit reviews_url
    click_on "Edit", match: :first

    fill_in "Created at", with: @review.created_at
    fill_in "Description", with: @review.description
    fill_in "Title", with: @review.title
    fill_in "Updated at", with: @review.updated_at
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
