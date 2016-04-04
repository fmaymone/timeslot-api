# require 'active_record/connection_adapters/postgresql_adapter'

module TSPgExplain
  # please also see activerecord_extension.rb

  # :nocov:
  def __explain_analyze(sql, command, *args)
    meth = "#{command}_without_explain_analyze".to_sym
    if /\A\s*SELECT/i =~ sql
      newsql = "EXPLAIN (ANALYZE, BUFFERS, VERBOSE) #{sql}"
      # newsql = "EXPLAIN (ANALYZE, BUFFERS) #{sql}"
      # newsql = "EXPLAIN (ANALYZE, VERBOSE) #{sql}"
      # newsql = "EXPLAIN ANALYZE #{sql}"
      plan = send(meth, newsql, *args).map { |row| row['QUERY PLAN'] }.join("\n")
      logger = Logger.new(STDOUT)
      logger.debug("\e[1m\e[31mQUERY PLAN FOR: #{sql.strip};\n#{plan}\e[0m")
    end
    send(meth, sql, *args)
  end

  def execute_with_explain_analyze(sql, *args)
    __explain_analyze(sql, :execute, *args)
  end

  def exec_query_with_explain_analyze(sql, *args)
    __explain_analyze(sql, :exec_query, *args)
  end
  # :nocov:
end
