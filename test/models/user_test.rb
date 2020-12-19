# frozen_string_literal: true

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

  test 'gets MAX_VOTE_COUNT from env variable' do
    ENV.stubs(:[]).with('MAX_VOTE_COUNT').returns('6')
    assert_equal 6, User.max_vote_count
  end
end
