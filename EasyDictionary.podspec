Pod::Spec.new do |s|
  s.name             = 'EasyDictionary'
  s.version          = '0.2.4'
  s.summary          = 'Nothing special just a few helpers to get values from a dictionary.'
  s.description      = <<-DESC
This little helper provides some methods to get optional and non-optional values from your dictionary. This can be used anywhere, but we use it mostly to parse data from an endpoint into an object.
                       DESC

  s.homepage         = 'https://github.com/roadmaptravel/EasyDictionary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'Niels Koole' => 'niels@getroadmap.com', 'Paul van Roosendaal' => 'paul@getroadmap.com', 'Roadmap' => 'appledevelopment@getroadmap.com' }
  s.source           = { :git => 'https://github.com/roadmaptravel/EasyDictionary.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/roadmaptravel'
  s.ios.deployment_target = '8.0'
  s.source_files     = 'EasyDictionary/Classes/**/*'
  s.swift_version    = '5.0'
end
