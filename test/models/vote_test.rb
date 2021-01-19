# frozen_string_literal: true

require 'test_helper'

# Tests Vote model
class VoteTest < ActiveSupport::TestCase
  test 'can not vote for candidate more than once' do
    user = users(:one)
    candidate = candidates(:one)
    vote = Vote.new(user: user, candidate: candidate)
    assert_not vote.valid?
    assert_equal 'has already been taken', vote.errors[:candidate].first
  end

  test 'user can vote for themselves if a candidate' do
    user = users(:two)
    candidate = candidates(:two)
    vote = Vote.new(user: user, candidate: candidate)
    assert vote.valid?
  end
end
