require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'john', email: 'john@example.com', password: 'password')
  end

  test 'should get users index' do
    get users_path
    assert_response :success
  end

  test 'should get new from /signup' do
    get '/signup'
    assert_response :success
  end

  test 'should get show' do
    get user_path(@user)
    assert_response :success
  end

  test 'should get /login' do
    get '/login'
    assert_response :success
  end

  test 'should redirect to user page after login' do
    sign_in_as(@user, 'password')
    follow_redirect!
    assert session[:user_id] == @user.id
    assert_template 'users/show'
  end
end
