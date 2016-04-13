module BusTracker::Screens
	class BaseScreen < BusTracker::BaseScreenKlass

		def initialize(world, opts = {})
      super(world)
    end

    def traits
      []
    end

    def non_traits
      []
    end

    def await(wait_opts = {})
      world.current_screens[self.class.name] = self if first_time?

      super wait_opts

      wait_for_elements_exist(traits, wait_opts) unless traits.empty?

      unless non_traits.empty?
        wait_for_elements_do_not_exist(non_traits, wait_opts)
      end
      self
    end

    protected

    def window
      world.window
    end
    
    def current_screens
      world.current_screens
    end
    
    def first_time?
      !world.current_screens.key? self.class.name
    end
  end
end