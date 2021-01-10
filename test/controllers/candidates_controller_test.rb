# frozen_string_literal: true

require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @candidate = candidates(:one)
  end

  test 'should get index' do
    CandidatesController.view_context_class.any_instance.stubs(:nominations_starts).returns(1.day.ago)
    CandidatesController.view_context_class.any_instance.stubs(:nominations_ends).returns(1.day.from_now)
    CandidatesController.view_context_class.any_instance.stubs(:voting_starts).returns(2.days.from_now)
    CandidatesController.view_context_class.any_instance.stubs(:voting_ends).returns(3.days.from_now)
    sign_in users(:one)
    get candidates_url
    assert_response :success
  end

  test 'should get new' do
    CandidatesController.view_context_class.any_instance.stubs(:within_nominations_period?).returns(true)
    sign_in users(:seven)
    get new_candidate_url
    assert_response :success
  end

  test 'should not get new' do
    CandidatesController.view_context_class.any_instance.stubs(:within_nominations_period?).returns(false)
    sign_in users(:seven)
    get new_candidate_url
    assert_response :redirect
  end

  test 'should create candidate' do
    sign_in users(:seven)
    assert_difference('Candidate.count') do
      post candidates_url, params: {
        candidate: {
          bio: @candidate.bio,
          first_name: @candidate.first_name,
          last_name: @candidate.last_name,
          professional: @candidate.professional,
          why: @candidate.why
        }
      }
    end
    assert_redirected_to candidate_url(Candidate.last)
  end

  test 'should not create candidate if there is an error' do
    sign_in users(:seven)
    assert_no_difference('Candidate.count') do
      post candidates_url, params: {
        candidate: {
          bio: @candidate.bio,
          first_name: @candidate.first_name,
          last_name: @candidate.last_name,
          professional: @candidate.professional
        }
      }
    end
    assert_response :success
  end

  test 'should show candidate' do
    sign_in @candidate.user
    CandidatesController.view_context_class.any_instance.stubs(:within_nominations_period?).returns(true)
    get candidate_url(@candidate)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @candidate.user
    get edit_candidate_url(@candidate)
    assert_response :success
  end

  test 'should not get edit' do
    sign_in users(:five)
    get edit_candidate_url(@candidate)
    assert_response :redirect
  end

  test 'should update candidate' do
    sign_in @candidate.user
    patch candidate_url(@candidate), params: {
      candidate: {
        bio: @candidate.bio,
        first_name: @candidate.first_name,
        last_name: @candidate.last_name,
        professional: @candidate.professional,
        why: @candidate.why
      }
    }
    assert_redirected_to candidate_url(@candidate)
  end

  test "should not update candidate if it is not one's own" do
    sign_in users(:five)
    patch candidate_url(@candidate), params: {
      candidate: {
        bio: @candidate.bio,
        first_name: @candidate.first_name,
        last_name: @candidate.last_name,
        professional: @candidate.professional,
        why: @candidate.why
      }
    }
    assert_response :redirect
    assert_equal 'You can only make changes to your own candidacy.', flash[:warning]
  end

  test 'should not update candidate if validation error occurs' do
    sign_in users(:one)
    patch candidate_url(@candidate), params:
      { candidate:
        {
          bio: @candidate.bio,
          first_name: @candidate.first_name,
          last_name: @candidate.last_name,
          professional: @candidate.professional,
          why: ''
        } }
    assert_response :success
    assert_not_equal '', @candidate.reload.why
  end

  test 'should destroy candidate' do
    sign_in @candidate.user
    assert_difference('Candidate.count', -1) do
      delete candidate_url(@candidate)
    end
    assert_redirected_to candidates_url
  end

  test 'should not destroy candidate' do
    sign_in users(:five)
    assert_difference('Candidate.count', 0) do
      delete candidate_url(@candidate)
    end
    assert_response :redirect
  end

  test 'user should be able to vote' do
    user = users(:two)
    sign_in user
    CandidatesController.view_context_class.any_instance.stubs(:within_voting_period?).returns(true)
    post vote_candidate_url(@candidate)
    assert_equal 'You voted! Yay!', flash[:notice]
    assert user.votes.find_by(candidate: @candidate)
    assert_response :redirect
  end

  test 'user should be able to remove vote' do
    user = users(:one)
    sign_in user
    CandidatesController.view_context_class.any_instance.stubs(:within_voting_period?).returns(true)
    post vote_candidate_url(@candidate)
    assert_response :redirect
    assert_equal 'You have removed your vote.', flash[:notice]
    assert_not user.votes.find_by(candidate: @candidate)
  end

  test 'user should not be able to vote if they have cast more than five votes' do
    user = users(:four)
    sign_in user
    assert_equal 5, user.votes.count
    CandidatesController.view_context_class.any_instance.stubs(:within_voting_period?).returns(true)
    post vote_candidate_url(@candidate)
    assert_response :redirect
    assert_equal "You've hit your maximum (#{User.max_vote_count}) number of allowed votes.", flash[:notice]
  end

  test 'users cannot vote if voting is not open' do
    user = users(:one)
    sign_in user
    CandidatesController.view_context_class.any_instance.stubs(:within_voting_period?).returns(false)
    post vote_candidate_url(@candidate)
    assert_response :redirect
    assert_equal 'Voting is not currently open; you cannot vote.', flash[:warning]
  end
end
