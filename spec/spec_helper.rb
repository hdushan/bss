$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'webmock/rspec'
SimpleCov.start do
  add_filter "/spec/"
end
require 'bsswizard'
require 'settings'
require 'bsswizard/version'

WebMock.allow_net_connect!
