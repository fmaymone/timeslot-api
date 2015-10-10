timespent_all = Benchmark.measure {
  json.partial! 'v1/slots/slots', slots: @slots
}
# pp "#{@slots.count} slots have taken #{timespent_all}"
Rails.logger.warn { "#{@slots.count} slots have taken #{timespent_all}"}
