# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'jinthepimp'
  app.development do
    app.info_plist['CFBundleIdentifier'] = 'com.alliants.jin.motion'
    app.provisioning_profile = "/Users/jinxie/Downloads/motionProfile.mobileprovision"
    app.codesign_certificate = "iPhone Developer: Tristan Gadsby (JUZB672T5T)"
    app.identifier = "com.alliants.jin.motion"
  end
end
