module BusTracker::Android::Screens
  class FavoritesScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Favorites'}"
    end

    def traits
      []
    end

    def switch_to_group(group)
      touch_w "* id:'tabs' descendant * {text LIKE '#{group}'}"
      fail unless query("* id:'tabs' descendant * {text LIKE '#{group}'}", :selected).first
    end

    def modify_group_name(group, name)
      switch_to_group group
      touch_w "* id:'action_bar_container' descendant * contentDescription:'More options'"
      wait_for_elements_exist ["* id:'title'"]
      touch_w "* id:'title' descendant * {text LIKE 'Rename group'}"
      wait_for_elements_exist ["* id:'alertTitle' descendant * {text LIKE 'Rename group'}"]
      touch_w "* id:'edit_group'"
      clear_text "* id:'edit_group'"
      keyboard_enter_text name
      touch_w "* id:'button1' descendant * {text LIKE 'Submit'}"
      wait_for_elements_exist ["* id:'tabs' descendant * {text LIKE '#{name}'}"]
    end
  end
end