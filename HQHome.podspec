#
# Be sure to run `pod lib lint HQHome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HQHome'
  s.version          = '0.1.0'
  s.summary          = '首页模块测试'

  s.description      = <<-DESC
  首页模块测试首页模块测试首页模块测试首页模块测试首页模块测试首页模块测试首页模块测试首页模块测试首页模块测试
                       DESC

  s.homepage         = 'https://github.com/LHQ25/HQHomeTest'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'louhanqing' => 'louhanqing2012@163.com' }
  s.source           = { :git => 'https://github.com/LHQ25/HQHomeTest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'

  s.ios.deployment_target = '10.0'

  s.source_files = 'HQHome/Classes/**/*'
  
   s.resource_bundles = {
     'HQHome' => ['HQHome/Assets/*.png', 'HQHome/Assets/*.bundle', 'HQHome/Assets/*.xcassets']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit' #, 'MapKit'
  s.dependency 'CTMediator'
  
  # s.dependency 'HQSearchExtension'
  # s.dependency 'HQNewsCategory'
end
