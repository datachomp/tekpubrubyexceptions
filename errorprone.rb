#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'
require 'net/http'
require 'optparse'
require 'uri'

#funsite = ARGV[0].to_s
#puts funsite

def perform_site_check(thesite)
  url = URI.parse(thesite)
  geteverything = Net::HTTP::Get.new(thesite)
  theresponse = Net::HTTP.start(url.host, url.port) { |http|
    http.request(geteverything)
  }

  return theresponse.code
end

#s = perform_site_check(funsite)

s = perform_site_check("http://tekpub.com")  #200  yay!
puts s
s = perform_site_check("http://tekpub.com/") #200  yay!
puts s
s = perform_site_check('tekpub.com/')  #Connection Refused
puts s
s = perform_site_check("http://tekpub.c/")  #name or service not known
puts s
s = perform_site_check("http://stackoverfaux.com")  #301
puts s
