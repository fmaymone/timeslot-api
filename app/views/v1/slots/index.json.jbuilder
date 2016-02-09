timespent_all = Benchmark.measure do
  json.partial! 'v1/slots/slots', slots: @slots
end
# pp "#{@slots.count} slots have taken #{timespent_all}"
Rails.logger.warn { "#{@slots.count} slots have taken #{timespent_all}" }
