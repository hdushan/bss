require "bss/version"

module BSS
  class BSS

  	def initialize(testconfig)
  		@testconfig = testconfig
  	end

    def get_initialized_sim(sim_number)
      if @testconfig.respond_to? :sim_reset_url
        puts "Initializing SIM #{sim_number}"
        beginning_time = Time.now
        response = RestClient.get @testconfig.sim_reset_url + sim_number
        puts "Initialized SIM in #{(Time.now-beginning_time).round} seconds. HTTP response code: #{response.code}"
        sim_number
      else
        puts "Cannot initialize SIM in this environment. Retreiving from TDS instead"
        get_sim_from_tds
      end
    end

    def get_sim_from_tds
      response = RestClient.get tds
      puts "SIM aquired from TDS: #{response.body}"
      response.body
    end

    def tds
      "http://10.0.20.200:56788/get_sim?env=prod_db&quantity=1&reserved_by=TestAuto&sim_type=fake"
    end

  end
end
