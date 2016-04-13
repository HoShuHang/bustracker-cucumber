require_relative 'base_screen'
module BusTracker::Android::Screens
  class ApplicationWindow < BusTracker::Screens::ApplicationWindow
    def object_for(class_name)
      Object.const_get("BusTracker::Android::Screens::#{class_name}")
    end
    Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].each do |file|
      make_screen_methods_from_file(file)
    end
    # attr_reader :last_screen

    # cur_dir = File.dirname(__FILE__)
    # Dir["#{cur_dir}/*/*.rb"].each do |file|
    #   method_name = File.basename(file, '.rb')
    #   define_method(method_name) do |opts = {}|
    #     options = { state: :normal }
    #     options.update(opts)
    #     class_name =
    #       method_name.gsub(/^[a-z0-9]|_[a-z0-9]/) { |a| a.upcase }
    #       .gsub(/_/, '')

    #     LOG "ApplicationWindow --- const get --- #{class_name}"
    #     obj = Object.const_get("BeanGo::Android::Screens::#{class_name}")
    #     # screen = page(obj, options).await
    #     screen = page(obj, opts)
    #     @last_screen = screen
    #     screen
    #   end
    # end
  end
end
