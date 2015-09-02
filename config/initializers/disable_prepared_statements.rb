# disabling postgres prepared statements as it seems we are biten by
# https://github.com/rails/rails/pull/17607
# different ways to disable them, for new lets go with this from:
# http://stackoverflow.com/a/28682798/531439
ActiveRecord::Base.establish_connection(
  ActiveRecord::Base.remove_connection.merge(prepared_statements: false)
)
