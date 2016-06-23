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
        puts "Initializing SIM #{sim_number}"
        beginning_time = Time.now
        response = RestClient.get Settings.sim_reset_url + sim_number
        puts "Initialized SIM in #{(Time.now-beginning_time).round} seconds. HTTP response code: #{response.code}"
        sim_number
      else
        puts "Cannot initialize SIM in PROD. Retreiving from TDS instead"
        get_sim_from_tds
      end
    end

    def get_sim_from_tds
      response = RestClient.get tds
      puts "SIM aquired from TDS: #{response.body}"
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
