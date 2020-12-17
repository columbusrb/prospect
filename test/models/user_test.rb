require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#candidate? returns false if user is not a candidate' do
    user_seven = users(:seven)
    assert_not user_seven.candidate?
  end

  test '#candidate? returns true if user is a candidate' do
    user = users(:one)
    assert user.candidate?
  end

  test '#candidate? returns true if user is a candidate' do
    user = users(:one)
    assert user.candidate?
  end
end
