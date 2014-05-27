module Elasticsearch
  module Persistence
    module Repository
      class DocumentNotFound < StandardError; end

      module Find
        def find(*args)
          options  = args.last.is_a?(Hash) ? args.pop : {}
          ids      = args

          if args.size == 1
            id = args.pop
            id.is_a?(Array) ? __find_many(id, options) : __find_one(id, options)
          else
            __find_many args, options
          end
        end

        def exists?(id, options={})
          type     = document_type || (klass ? __get_type_from_class(klass) : '_all')
          client.exists( { index: index_name, type: type, id: id }.merge(options) )
        end

        def __find_one(id, options={})
          type     = document_type || (klass ? __get_type_from_class(klass) : '_all')
          document = client.get( { index: index_name, type: type, id: id }.merge(options) )

          deserialize(document)
        rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
          raise DocumentNotFound, e.message, caller
        end

        def __find_many(ids, options={})
          type     = document_type || (klass ? __get_type_from_class(klass) : '_all')
          documents = client.mget( { index: index_name, type: type, body: { ids: ids } }.merge(options) )

          documents['docs'].map { |document| document['found'] ? deserialize(document) : nil }
        end
      end

    end
  end
end
