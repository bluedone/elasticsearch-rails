require 'elasticsearch'
require 'hashie'

require 'active_support/inflector'

require 'elasticsearch/persistence/version'

require 'elasticsearch/persistence/client'
require 'elasticsearch/persistence/repository/response/results'
require 'elasticsearch/persistence/repository/naming'
require 'elasticsearch/persistence/repository/serialize'
require 'elasticsearch/persistence/repository/store'
require 'elasticsearch/persistence/repository/find'
require 'elasticsearch/persistence/repository/search'
require 'elasticsearch/persistence/repository'

require 'elasticsearch/persistence/repository/class'

module Elasticsearch
  module Persistence

    # :nodoc:
    module ClassMethods
      def client
        @client ||= Elasticsearch::Client.new
      end

      def client=(client)
        @client = client
      end
    end

    extend ClassMethods
  end
end
