require 'test_helper'

class CurrisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curri = curris(:one)
  end

  test "should get index" do
    get curris_url
    assert_response :success
  end

  test "should get new" do
    get new_curri_url
    assert_response :success
  end

  test "should create curri" do
    assert_difference('Curri.count') do
      post curris_url, params: { curri: {  } }
    end

    assert_redirected_to curri_url(Curri.last)
  end

  test "should show curri" do
    get curri_url(@curri)
    assert_response :success
  end

  test "should get edit" do
    get edit_curri_url(@curri)
    assert_response :success
  end

  test "should update curri" do
    patch curri_url(@curri), params: { curri: {  } }
    assert_redirected_to curri_url(@curri)
  end

  test "should destroy curri" do
    assert_difference('Curri.count', -1) do
      delete curri_url(@curri)
    end

    assert_redirected_to curris_url
  end
end
