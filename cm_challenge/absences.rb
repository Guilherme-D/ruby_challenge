require_relative './api'
require 'icalendar'

module CmChallenge
  class Absences

    #initialize with sended params
    def initialize params={}

      #Get all absences and members using the api
      @absences = CmChallenge::Api.absences
      @members = CmChallenge::Api.members 

      # is received a parameter, check which one is 
      # and select the proper absence and members 
      if params["userId"].present?
        @absences = @absences.select{
          |absence| absence[:user_id] == params["userId"].to_i
        }
        @members = @members.select{
          |member| member[:user_id] == params["userId"].to_i
        }
      end

      if params["startDate"].present?
        @absences = @absences.select{
          |absence| absence[:start_date] == params["userId"].to_i
        }
      end

      if params["endDate"].present?
        @absences = @absences.select{
          |absence| absence[:endDate] == params["userId"].to_i
        }
      end
      
    end

    def to_ical

      #Get all absences and members using the api
      @absences = CmChallenge::Api.absences
      @members = CmChallenge::Api.members 
      #create a new icalendar object
      cal = Icalendar::Calendar.new

      #for each absence returned 
      @absences.each do |absences|

        #check all absent member
        member = @members.find{
          |member| member[:user_id].eql? absences[:user_id]
        }
        
        #set the values to iCalendar object
        cal.event do |e|
          e.description = get_absence_description(member[:name], absences[:member_note])
          e.summary = get_absence_summary(member[:name], absences[:type])
          e.dtstart = Icalendar::Values::Date.new(absences[:start_date].gsub('-',''))
          e.dtend = Icalendar::Values::Date.new(absences[:end_date].gsub('-',''))
        end
      end
      cal
    end

    #get a summary depending on the given reason
    def get_absence_summary(name, reason)
      summary = "#{name} is absent without a reason"
      summary = "#{name} is sick" if reason.eql? "sickness"
      summary = "#{name} is on vacation" if reason.eql? "vacation"
      summary
    end

    def get_absence_description(name, note)
      description = ""
      description = "Note from #{name}: #{note}" if !note.empty?
      description
    end
  end
end