require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def do_login(user = nil)
    user = user || User.first
    pwd_text = 'MyString'
    post login_path, params:{ :session => {:account=> user[:account], :password => pwd_text}}
  end

  def set_owner_user_id(obj)
    user_id = {:owner_user_id => User.first.id}
    !!(defined? obj.update_all) ? obj.update_all(user_id) : obj.update(user_id)
  end
end
