#
# Be sure to run `pod lib lint Elina.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Elina'
  s.version          = '0.3.4'
  s.summary          = 'Joke pod for pranking'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Elina-nyan is kawaii. Why? because Elina-nyan is kawaii.
                       DESC

  s.homepage         = 'https://github.com/Cyanide7523/Elina'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cyanide7523' => 'ffasang123@icloud.com' }
  s.source           = { :git => 'https://github.com/Cyanide7523/Elina.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/Lailac3257'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Elina/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Elina' => ['Elina/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
