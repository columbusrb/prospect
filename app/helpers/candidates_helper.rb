# frozen_string_literal: true

# Helper methods for setting date-dependent features
module CandidatesHelper
  def nominations_starts
    Date.parse(ENV.fetch('NOMINATIONS_START_DATE'))
  end

  def nominations_ends
    Date.parse(ENV.fetch('NOMINATIONS_END_DATE'))
  end

  def voting_starts
    Date.parse(ENV.fetch('VOTING_START_DATE'))
  end

  def voting_ends
    Date.parse(ENV.fetch('VOTING_END_DATE'))
  end

  def within_nominations_period?
    (nominations_starts..nominations_ends).cover?(Time.zone.today)
  end

  def within_voting_period?
    (voting_starts..voting_ends).cover?(Time.zone.today)
  end

  def voting_over?
    Time.zone.today > voting_ends
  end
end
