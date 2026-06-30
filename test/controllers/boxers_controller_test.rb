require "test_helper"

class BoxersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boxer = boxers(:one)
  end

  test "should get index" do
    get boxers_url
    assert_response :success
  end

  test "should get new" do
    get new_boxer_url
    assert_response :success
  end

  test "should create boxer" do
    assert_difference("Boxer.count") do
      post boxers_url, params: { boxer: { name: @boxer.name, record: @boxer.record, style: @boxer.style, weight_class: @boxer.weight_class } }
    end

    assert_redirected_to boxer_url(Boxer.last)
  end

  test "should show boxer" do
    get boxer_url(@boxer)
    assert_response :success
  end

  test "should get edit" do
    get edit_boxer_url(@boxer)
    assert_response :success
  end

  test "should update boxer" do
    patch boxer_url(@boxer), params: { boxer: { name: @boxer.name, record: @boxer.record, style: @boxer.style, weight_class: @boxer.weight_class } }
    assert_redirected_to boxer_url(@boxer)
  end

  test "should destroy boxer" do
    assert_difference("Boxer.count", -1) do
      delete boxer_url(@boxer)
    end

    assert_redirected_to boxers_url
  end
end
