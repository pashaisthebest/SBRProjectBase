#
# Be sure to run `pod lib lint SBRProjectBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SBRProjectBase"
  s.version          = "0.1.2"
  s.summary          = "A pod that contains several base classes and helpers to be a start for any project"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "A pod that contains several base classes and helpers to be a start for any project. description"

  s.homepage         = "https://github.com/pashaisthebest/SBRProjectBase"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Pavel Gurov" => "pashaisthebest@gmail.com" }
  s.source           = { :git => "https://github.com/pashaisthebest/SBRProjectBase", :tag => s.version.to_s }
  s.social_media_url = 'https://vk.com/pashaisthebest'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SBRProjectBase' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Google/Analytics'

end
