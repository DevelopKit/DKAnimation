#
# Be sure to run `pod lib lint DKAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DKAnimation'
  s.version          = '0.1.0'
  s.summary          = 'Make it easier to do animation in apps'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Using POP to Make it easier to do animation in apps
                       DESC

  s.homepage         = 'https://github.com/DevelopKit/DKAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qiang zhai' => 'zq4950411@163.com' }
  s.source           = { :git => 'https://github.com/DevelopKit/DKAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DKAnimation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DKAnimation' => ['DKAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'pop'
end
