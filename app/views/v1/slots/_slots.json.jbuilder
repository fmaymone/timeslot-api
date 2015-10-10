json.array!(slots) do |slot|
  timespent = Benchmark.measure {
    json.partial! 'v1/slots/slot', slot: slot
    json.url v1_slot_url(slot, format: :json)
  }
  # pp "slot with ID #{slot.id} took #{timespent.to_s.strip} time"
  Rails.logger.warn { "slot with ID #{slot.id} took #{timespent.to_s.strip} time."}
end
