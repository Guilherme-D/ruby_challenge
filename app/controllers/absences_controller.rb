require_relative '../../cm_challenge/absences.rb'
class AbsencesController < ApplicationController
  def index
    ical_file = CmChallenge::Absences.new(params).to_ical
    send_data ical_file.to_ical, filename: "absences.ics"
  end
end
