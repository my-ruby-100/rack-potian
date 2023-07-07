# https://ruby-china.org/topics/34681

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)