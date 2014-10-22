require 'mixlib/cli'

module ChefMetalTestSuite
  class Cli
    include Mixlib::CLI

    option :server_type,
      :short => '-s SERVER TYPE',
      :long => '--server-type SERVER TYPE',
      :default => :zero,
      :description => 'Chef Server Type',
      :proc => Proc.new { |s| s.to_sym }

    option :metal_driver,
      :short => '-d METAL DRIVER',
      :long => '--metal-driver METAL DRIVER',
      :default => :vagrant,
      :description => 'Chef Metal Driver',
      :proc => Proc.new { |d| d.to_sym }

    option :os_platform,
      :short => '-p OS PLATFORM',
      :long => '--plaftorm OS PLATFORM',
      :default => :ubuntu,
      :description => 'Operating System',
      :proc => Proc.new { |p| p.to_sym }

    option :os_version,
      :short => '-v OS VERSION',
      :long => '--version OS VERSION',
      :default => '14.04',
      :description => 'Operating System Plaftorm Version',

    option :help,
      :short => "-h",
      :long => "--help",
      :description => "Show this message",
      :on => :tail,
      :boolean => true,
      :show_options => true,
      :exit => 0

    def run(argv=ARGV)
      parse_options(argv)
      ChefMetalTestSuite::Config.test_recipes = cli_arguments if cli_arguments
      ChefMetalTestSuite::Config.merge!(config)
      #ChefMetalTestSuite::Config.validate
    end
  end
end
