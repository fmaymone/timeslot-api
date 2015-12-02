json.partial! 'v1/slots/slot', slot: slot

# more a hack than anything else:
# show some counters in json on slot create/ delete
# by overriding the already rendered creator json
json.creator do
  json.partial! 'v1/users/basic_user', user: slot.creator
end
