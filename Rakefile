# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # integrate 3rd party framework
  app.vendor_project('vendor/Fabric.framework', :static, :products => ['Fabric'], :headers_dir => 'Headers')
  app.vendor_project('vendor/Crashlytics.framework', :static, :products => ['Crashlytics'], :headers_dir => 'Headers')

  app.libs += ["/usr/lib/libz.dylib",
               "/usr/lib/libc++.dylib"]

  app.frameworks += ['Security',
                     'SystemConfiguration']

  app.info_plist['Fabric'] = {
    'APIKey' => ENV['FABRIC_API_KEY'],
    'Kits' => [{
      'KitInfo' => {
        'consumerKey' => ENV['FABRIC_CONSUMER_KEY'],
        'consumerSecret' => ENV['FABRIC_CONSUMER_SECRET']
      },
      'KitName' => 'Crashlytics'
    }]
  }

  # Use `rake config' to see complete project settings.
  app.name = 'jinthepimp'
  app.development do
    app.info_plist['CFBundleIdentifier'] = 'com.alliants.jin.motion'
    app.provisioning_profile = "./motionProfile.mobileprovision"
    app.codesign_certificate = "iPhone Developer: Tristan Gadsby (JUZB672T5T)"
    app.identifier = "com.alliants.jin.motion"
  end
end
