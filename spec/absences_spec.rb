require 'icalendar'
require_relative '../cm_challenge/absences'

RSpec.describe 'Absences' do
  describe 'test_ical' do

    subject {
       CmChallenge::Absences.new.to_ical
    }
    
    #check if realy sended in icall object
    it 'is an ical object' do
      expect(subject.class).to eq(Icalendar::Calendar)
    end

    #check if realy added all icall events
    it 'has all ical events' do
      expect(subject.events.count).to eq(42)
    end

    #check if realy set the correct datas to icall object
    #comparing the first added data with what should be
    it 'set correct datas to ical' do
      #check first from object must be the first of expected 
      expect(subject.events.first.summary).to eq("Mike is sick")
      expect(subject.events.first.description).to eq("")
      expect(subject.events.first.dtstart.to_s).to eq("2017-01-13")
      expect(subject.events.first.dtend.to_s).to eq("2017-01-13")
    end
  end
end