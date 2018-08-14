require 'test_helper'

class FreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @free = frees(:one)
  end

  test "should get index" do
    get frees_url
    assert_response :success
  end

  test "should get new" do
    get new_free_url
    assert_response :success
  end

  test "should create free" do
    assert_difference('Free.count') do
      post frees_url, params: { free: { content: @free.content, title: @free.title, user_id: @free.user_id } }
    end

    assert_redirected_to free_url(Free.last)
  end

  test "should show free" do
    get free_url(@free)
    assert_response :success
  end

  test "should get edit" do
    get edit_free_url(@free)
    assert_response :success
  end

  test "should update free" do
    patch free_url(@free), params: { free: { content: @free.content, title: @free.title, user_id: @free.user_id } }
    assert_redirected_to free_url(@free)
  end

  test "should destroy free" do
    assert_difference('Free.count', -1) do
      delete free_url(@free)
    end

    assert_redirected_to frees_url
  end
end
