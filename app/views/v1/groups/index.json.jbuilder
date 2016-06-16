json.result @groups do |group|
  json.partial! 'v1/groups/group', group: group
end
