require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test 'user should be unique' do
    user = users(:one)
    candidate = Candidate.new(user: user)
    assert_not candidate.valid?
  end

  test 'first_name is required for candidate' do
    candidate = Candidate.new()
    assert_not candidate.valid?
    assert_equal "can't be blank", candidate.errors[:first_name].first
  end

  test 'last_name is required for candidate' do
    candidate = Candidate.new()
    assert_not candidate.valid?
    assert_equal "can't be blank", candidate.errors[:last_name].first
  end

  test 'bio is required for candidate' do
    candidate = Candidate.new()
    assert_not candidate.valid?
    assert_equal "can't be blank", candidate.errors[:bio].first
  end

  test 'why (reason for running) is required for candidate' do
    candidate = Candidate.new()
    assert_not candidate.valid?
    assert_equal "can't be blank", candidate.errors[:why].first
  end

  test 'votes_count should return count of all votes' do
    candidate = candidates(:one)
    votes = candidate.votes.count
    assert_equal votes, candidate.votes_count
  end

  test 'display first and last name as full name' do
    candidate = candidates(:one)
    name = "#{candidate.first_name} #{candidate.last_name}"
    assert_equal name, candidate.full_name
  end

  test '#new_board_members has max of five' do
    candidates = Candidate.new_board_members
    assert_not candidates.length > 5
  end

  test '#new_board_members gets board members with most votes' do
    candidates = Candidate.new_board_members
    assert_not_includes candidates, candidates(:five)
    assert_includes candidates, candidates(:one)
  end
end
