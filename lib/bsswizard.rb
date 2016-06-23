require "bsswizard/version"
require "rest-client"
require_relative 'settings'

module BSSWizard
  class BSS

  	def initialize(env)
  		@env = env
  		Settings.setup(environment)
  	end

    def get_initialized_sim(sim_number)
      if environment != "production"
        get_sim_from_initializer(sim_number)
      else
        get_new_sim_from_tds
      end
    end

    def get_sim_from_initializer(sim)
      beginning_time = Time.now
      response = RestClient.get Settings.sim_reset_url + sim
      puts "Initialized SIM #{sim} in #{(Time.now-beginning_time).round} seconds. HTTP response code: #{response.code}"
      sim
    end

    def get_new_sim_from_tds
      beginning_time = Time.now
      response = RestClient.get tds
      puts "SIM aquired from TDS: #{response.body} in #{(Time.now-beginning_time).round} seconds. HTTP response code: #{response.code}"
      response.body
    end

    def tds
      Settings.tds_url
    end

    def environment
  	  @env.match(/prod/i)?'production':'battlefield'
    end

  end
end
