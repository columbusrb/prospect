require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @candidate = candidates(:one)
  end

  test 'should get index' do
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
      post candidates_url, params: { candidate: {
        bio: @candidate.bio,
        first_name: @candidate.first_name,
        last_name: @candidate.last_name,
        professional: @candidate.professional,
        user_id: @candidate.user_id,
        why: @candidate.why }
      }
    end

    assert_redirected_to candidate_url(Candidate.last)
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
    patch candidate_url(@candidate), params:
    { candidate:
      {
        bio: @candidate.bio,
        first_name: @candidate.first_name,
        last_name: @candidate.last_name,
        professional: @candidate.professional,
        user_id: @candidate.user_id,
        why: @candidate.why
      } }
    assert_redirected_to candidate_url(@candidate)
  end

  test 'should not update candidate' do
    sign_in users(:five)
    patch candidate_url(@candidate), params:
      { candidate:
        {
          bio: @candidate.bio,
          first_name: @candidate.first_name,
          last_name: @candidate.last_name,
          professional: @candidate.professional,
          user_id: @candidate.user_id,
          why: @candidate.why
        } }
    assert_response :redirect
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
end
