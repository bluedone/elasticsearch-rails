module Elasticsearch
  module Model

    # Contains modules and classes for wrapping the response from Elasticsearch
    #
    module Response

      # Encapsulate the response returned from the Elasticsearch client
      #
      # Implements Enumerable and forwards its methods to the {#results} object.
      #
      class Response
        attr_reader :klass, :search, :response,
                    :took, :timed_out, :shards

        include Enumerable
        extend  Support::Forwardable

        forward :results, :each, :empty?, :size, :slice, :[], :to_ary

        def initialize(klass, search, response)
          @klass     = klass
          @search    = search
          @response  = response
          @took      = response['took']
          @timed_out = response['timed_out']
          @shards    = Hashie::Mash.new(response['_shards'])
        end

        # Return the collection of "hits" from Elasticsearch
        #
        def results
          @response ||= search.execute!
          @results  ||= Results.new(klass, response)
        end

        # Return the collection of records from the database
        #
        def records
          @response ||= search.execute!
          @records  ||= Records.new(klass, response, results)
        end

      end
    end
  end
end
