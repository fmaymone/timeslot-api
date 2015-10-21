module ActiveRecord
  class Base
    include TSPreventDeletion
  end

  module ConnectionAdapters
    class PostgreSQLAdapter
      include TSPgExplain

      # to enable explain analyze via rspec tag
      def self.show_explain
        alias_method_chain :execute, :explain_analyze
        alias_method_chain :exec_query, :explain_analyze
      end

      def self.hide_explain
        alias_method :execute, :execute
        alias_method :exec_query, :exec_query
      end

      # to enable explain analyze via env var, needs app restart
      if ENV['PG_EXPLAIN'].nil? ? false : ENV['PG_EXPLAIN'] == 'true'
        show_explain
      end
    end
  end
end
