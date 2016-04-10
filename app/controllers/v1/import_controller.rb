require 'net/http'

module V1
  class ImportController < ApplicationController

    def handler
      authorize :import

      file = params.require(:file).read
      #file = File.binread(params.require(:file).path)
      #file = File.open(params.require(:file).path, 'r:ASCII-8BIT', &:read)
      #file = File.open(params.require(:file).path,'r:iso-8859-1:utf-8').readlines.to_s

      return head 403 unless file.valid_encoding?

      case determine_type(file)
      when 'google'
        events = GoogleAdapter.new(file: file).import
      when 'ical'
        events = IcalAdapter.new(file: file).import
      when 'outlook'
        events = OutlookAdapter.new(file: file).import
      when 'timeslot'
        events = TimeslotAdapter.new(file: file).import
      else
        return head 422
      end

      # Asynchronous:
      ImportJob.perform_async(events, current_user, params[:group])
      head :ok

      # Synchronous:
      #status = Import.handler(events, current_user, params[:group])
      #head status ? :ok : :err
    end

    ## HELPERS ##

    private def determine_type(file)
      if file.starts_with?('BEGIN:VCALENDAR')
        'ical'
      elsif (file.include?('Subject') || file.include?('Subject')) &&
            (file.include?('Start Date') || file.include?('Start Date'))
        'outlook'
      elsif file.include?('{') &&
          file.include?('start_date') &&
          file.include?('image_url') &&
          file.include?('title') &&
          file.include?('}')
        'timeslot'
      else
        'unknown'
      end
    end
  end
end
