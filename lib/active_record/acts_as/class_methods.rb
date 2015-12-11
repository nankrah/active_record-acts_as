module ActiveRecord
  module ActsAs
    module ClassMethods
      def self.included(module_)
        module_.alias_method_chain :_reflections, :acts_as
      end



      def _reflections_with_acts_as

         puts '######START#####'
         puts "reflections without acts as: #{_reflections_without_acts_as.keys.join(', ')}"

         puts "acting_as_model: #{acting_as_name}"
         puts "acting model reflections:  #{acting_as_model._reflections.keys.join(', ')}"
         puts '###END####'
         puts "\r\r\r"
        @_reflections_acts_as_cache ||=
          _reflections_without_acts_as.reverse_merge(acting_as_model._reflections)

         @_reflections_acts_as_cache.delete_if{|k,v| puts "KEY:#{k}"; k.to_s == acting_as_name}

         puts "#{@_reflections_acts_as_cache.keys}"
         puts '###END####'
         puts "\r\r\r"
         @_reflections_acts_as_cache
      end

      def validators_on(*args)
        super + acting_as_model.validators_on(*args)
      end
    end
  end
end
