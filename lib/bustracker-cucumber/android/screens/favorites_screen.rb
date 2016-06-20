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
      more_options 'Rename group'
      touch_w "* id:'edit_group'"
      clear_text "* id:'edit_group'"
      keyboard_enter_text name
      touch_w "* id:'button1' descendant * {text LIKE 'Submit'}"
      wait_for_elements_exist ["* id:'tabs' descendant * {text LIKE '#{name}'}"]
    end

    def move_to_first_priority(group)
      switch_to_group group
      more_options 'Reorder groups'
      index = query("* id:'text_title'", :text).index(group)
      drag_and_drop("* id:'drag_handle' index:#{index}", "* id:'drag_handle' index:0")
      fail "drag error" unless query("* id:'text_title'", :text).index(group) == 0
    end

    def delete_group(group)
      switch_to_group group
      more_options 'Remove group'
      wait_for_elements_exist ["* id:'alertTitle' descendant * {text LIKE '#{group}'}"]
      touch_w "* id:'button1' descendant * {text LIKE 'Submit'}"
      wait_for_elements_do_not_exist ["* id:'tabs' descendant * {text LIKE '#{group}'}"]
    end

    def delete_favorite_stop(bus)
      touch_w "* id:'text_routename' descendant * {text CONTAINS '#{bus}'}"
      touch_w "* id:'text_view' descendant * {text LIKE 'Remove'}"
      wait_for_elements_exist ["* id:'alertTitle' descendant * {text LIKE 'Remove favorite'}"]
      touch_w "* id:'button1' descendant * {text LIKE 'Yes'}"
      wait_for_elements_do_not_exist ["* id:'tabs'"]
    end

    def more_options(title)
      touch_w "* id:'action_bar_container' descendant * contentDescription:'More options'"
      wait_for_elements_exist ["* id:'title'"]
      touch_w "* id:'title' descendant * {text LIKE '#{title}'}" 
      wait_for_elements_exist ["* id:'alertTitle' descendant * {text LIKE '#{title}'}"] if title != 'Remove group'
    end
  end
end