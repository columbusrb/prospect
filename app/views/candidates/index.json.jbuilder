# frozen_string_literal: true

json.array! @candidates, partial: 'candidates/candidate', as: :candidate
