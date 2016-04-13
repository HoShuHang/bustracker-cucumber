require_relative 'base_screen'

module BusTracker::Screens
  class ApplicationWindow < BaseScreen
    attr_reader :last_screen

    def self.make_screen_methods_from_file(file)
      method_name = File.basename(file, '.rb')
      return unless method_name.end_with? 'screen'

      define_method(method_name) do |opts = {}|
        opts[:state] ||= :normal
        class_name =
          method_name.gsub(/^[a-z0-9]|_[a-z0-9]/) { |a| a.upcase }
          .gsub(/_/, '')

        obj = object_for(class_name)
        key = obj.to_s.to_sym
        if screens.key?(key)
          screen = screens[key]
        else
          screen = page(obj, opts)
          screens[key] = screen
        end
        @last_screen = screen
        screen
      end
    end

    def screens
      @screens ||= {}
    end

    def object_for(class_name)
      Object.const_get("BusTracker::Screens::#{class_name}")
    end
  end
end
