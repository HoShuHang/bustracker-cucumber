module BusTracker::Android::Actions::HookActions
  require 'calabash-android/management/app_installation'
  require 'calabash-android/management/adb'
  require 'calabash-android/operations'

  def current_feature_name(scenario)
    @scenario_is_outline =
      (scenario.class == Cucumber::Core::Ast::ScenarioOutline)
    scenario = scenario.scenario_outline if @scenario_is_outline
    scenario.feature.title
  end

  def current_feature?(feature_name)
    FeatureNameMemory.feature_name == feature_name
  end

  def startup
    start_test_server_in_background
    @window = page(BusTracker::Android::Screens::ApplicationWindow)
    begin
      # modify timeout: 60 for android device
      @window.main_screen.await(timeout: 60)
    rescue
      p "rescue"
      clear_app_data
      shutdown_test_server
      start_test_server_in_background
      @window.watch_screen.await(timeout: 60)
    end   
    # perform_action('hide_soft_keyboard')
  end

  def before_scenario(scenario)
    install if install?
    startup
    feature_name = current_feature_name(scenario)
    if !current_feature?(feature_name) || reset_between_scenarios?
      # if reset_between_scenarios?
      #   log 'New scenario - reinstalling apps'
      # else
      #   log 'First scenario in feature - reinstalling apps'
      # end
      FeatureNameMemory.feature_name = feature_name
      FeatureNameMemory.invocation = 1
    else
      FeatureNameMemory.invocation += 1
    end
  end

  def after_scenario(scenario)
    screenshot_embed if scenario.failed?
    return if ENV['NO_STOP'] == '1'
    clear_app_data
    shutdown_test_server
  end

  def install
    uninstall_apps
    install_app(ENV['TEST_APP_PATH'])
    install_app(ENV['APP_PATH'])
    $app_installed  = true
  end
  
	def install?
	  return false if ENV['NO_INSTALL'] == '1'
	  !installed? || reset_between_scenarios?
	end

	def installed?
	  # res = FeatureNameMemory.app_installed == true
	  res = $app_installed == true
	  res
	end

  def reset_between_scenarios?
    res = ENV['reset_between_scenarios'] == '1'
    res
  end
end

at_exit do
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
  # attr_accessor :app_installed
end

AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
end