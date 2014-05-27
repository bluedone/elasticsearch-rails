module Elasticsearch
  module Persistence
    module Repository

      module Naming
        def klass name=nil
          @klass = name || @klass
        end

        def klass=klass
          @klass = klass
        end

        def index_name name=nil
          @index_name = name || @index_name || self.class.to_s.underscore.gsub(/\//, '-')
        end

        def index_name=(name)
          @index_name = name
        end

        def document_type
          klass.to_s.underscore
        end

        def __get_klass_from_type(type)
          klass = type.classify
          klass.constantize
        rescue NameError => e
          raise NameError, "Attempted to get class '#{klass}' from the '#{type}' type, but no such class can be found."
        end

        def __get_type_from_class(klass)
          klass.to_s.underscore
        end

        def __get_id_from_document(document)
          document[:id] || document['id'] || document[:_id] || document['_id']
        end
      end

    end
  end
end
