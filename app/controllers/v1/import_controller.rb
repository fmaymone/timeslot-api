require 'net/http'

module V1
  class ImportController < ApplicationController

    # POST /v1/import/
    def handler
      authorize :import

      # NOTE: Supported file format is binary, JSON or String
      if params.require(:file).kind_of?(Array)
        file = params[:file].join('')
      else
        file = params[:file].try(:read) || params[:file]
      end

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

      if Rails.env.production?
        # Asynchronous:
        ImportJob.perform_async(events, current_user, params[:group])
        head :ok
      else
        # Synchronous:
        status = Import.handler(events, current_user, params[:group])
        head status ? :ok : :err
      end
    end

    ## HELPERS ##

    private def determine_type(file)
      if file.starts_with?('BEGIN:VCALENDAR')
        'ical'
      elsif file.starts_with?('Subject,Start_Date,Start_Time,End_Date,End_Time')
        'outlook'
      elsif file.include?('{') &&
          file.include?('uid') &&
          file.include?('start') &&
          file.include?('visibility') &&
          file.include?('location') &&
          file.include?('title') &&
          file.include?('}')
        'timeslot'
      else
        'unknown'
      end
    end
  end
end
