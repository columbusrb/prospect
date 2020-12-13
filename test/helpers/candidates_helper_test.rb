require 'test_helper'

class CandidatesHelperTest < ActionView::TestCase
  test '#within_nominations_period? returns true if today is within the nominations period' do
    self.stubs(:nominations_starts).returns(5.days.ago)
    self.stubs(:nominations_ends).returns(5.days.since)
    assert within_nominations_period?
  end

  test '#within_nominations_period? returns false if today is not within the nominations period' do
    self.stubs(:nominations_starts).returns(10.days.ago)
    self.stubs(:nominations_ends).returns(5.days.ago)
    assert_not within_nominations_period?
  end

  test '#within_voting_period? returns true if today is within the voting period' do
    self.stubs(:voting_starts).returns(5.days.ago)
    self.stubs(:voting_ends).returns(5.days.since)
    assert within_voting_period?
  end

  test '#within_voting_period? returns true if today is not within the voting period' do
    self.stubs(:voting_starts).returns(10.days.ago)
    self.stubs(:voting_ends).returns(5.days.ago)
    assert_not within_voting_period?
  end

  test '#voting_over? should return true if today is after the voting period' do
    self.stubs(:voting_ends).returns(5.days.ago)
    assert voting_over?
  end

  test '#voting_over? should return false if today is during the voting period' do
    self.stubs(:voting_ends).returns(5.days.since)
    assert_not voting_over?
  end
end