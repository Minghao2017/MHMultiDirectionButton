#
# Be sure to run `pod lib lint WSMultiDirectionButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WSMultiDirectionButton'
  s.version          = '0.1.0'
  s.summary          = 'WSMultiDirectionButton, a subclass of UIButton that supported multi-direction about image and title.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        WSMultiDirectionButton, a subclass of UIButton that supported multi-direction about image and title.
                        * Fully support code interation and Interface Builder design
                        * You can adjust the button to default left-to-right,right-toleft,vertical modes.And also the spacing between image view and label. So easy to do this in IB
                       DESC

  s.homepage         = 'https://github.com/Wilson2014/WSMultiDirectionButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wilson' => 'xue_minghao@qq.com' }
  s.source           = { :git => 'https://github.com/Wilson2014/WSMultiDirectionButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WSMultiDirectionButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WSMultiDirectionButton' => ['WSMultiDirectionButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
