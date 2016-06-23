$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'bsswizard'
require 'settings'

WebMock.allow_net_connect!
