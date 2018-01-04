require "activerecord_timeline/engine"

module ActiverecordTimeline
  module TimeLineEvented
    def self.included(klass)
      klass.send(:extend, ClassMethods)
    end

    module ClassMethods
      def declares_line_point(event, method_args)
        # Check methods and executors
        unless method_args.has_key?(:on)
          raise 'Invalid line point declaration'
        end
        unless !method_args.has_key?(:executor) or  self.reflections.has_key?(method_args[:executor].to_s)
          raise 'Executor must be an existing relation'
        end
        # Array provided, set multiple callbacks
        if method_args[:on].is_a?(Array)
          method_args[:on].each { |on| declares_line_point(event, method_args.merge({:on => on})) }
          return
        end

        callback_definition = :"timeline_callback_definition_#{event}_#{method_args[:on]}"
        define_method(callback_definition) {
          target = self
          executor = nil
          if method_args.has_key? :executor
            executor = self.send(method_args[:executor])
          else
            executor = self
          end
          changes = self.saved_changes
          if method_args.has_key? :attributes
            for attribute in method_args[:attributes]
              changes.delete attribute
            end
          end
          old_values = changes.keys.inject({}) do |mem, key|
            puts "#{mem} - #{key}"
            mem[key.to_sym] = hash[key.to_sym][0]
            mem
          end
          new_values = changes.keys.inject({}) do |mem, key|
            puts "#{mem} - #{key}"
            mem[key.to_sym] = hash[key.to_sym][1]
            mem
          end

          record_values = {new_values: new_values, old_values: old_values, event_type: event, target: target, executor: executor}
          ::ActiverecordTimeline::TimeLineRecord.create(record_values)
        }

        send(:"after_#{method_args[:on]}", callback_definition, :if => method_args[:if])
      end
    end
  end
end
