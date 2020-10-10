require_relative '../../cm_challenge/absences.rb'
class AbsencesController < ApplicationController
  def index
    @ical = CmChallenge::Absences.new.to_ical
  end
end
