require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    test 'can view all users' do
        get show_all_users_path, { controller: :users, action: :show_user_path }
        assert_template 'users/show_all_users'
    end
    
    test 'can view a single user' do
        user = users(:user1)
        get show_user_path(user), { controller: :users, action: :show_user_path }
        assert_template 'users/show_user'
    end
end