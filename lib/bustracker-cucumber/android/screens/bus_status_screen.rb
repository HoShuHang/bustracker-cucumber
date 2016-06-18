module BusTracker::Android::Screens
  class BusStatusScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @text_estimate = "* id:'text_estimate'"
      @text_routename = "* id:'text_routename'"
      @counter_view = "* id:'counter_view'"
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar_container'"
    end

    def traits
      [@text_estimate, @text_routename, @counter_view]
    end
  end
end