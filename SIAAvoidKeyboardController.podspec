#
# Be sure to run `pod lib lint SIAAvoidKeyboardController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SIAAvoidKeyboardController"
  s.version          = "0.1.0"
  s.summary          = "Control scroll view whether keyboard is displayed or not."
  s.description      = <<-DESC
                       Control scroll view whether keyboard is displayed or not.
                       All we have to do is setup of UIScrollView.
                       DESC
  s.homepage         = "https://github.com/siagency/SIAAvoidKeyboardController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "SI Agency" => "support@si-agency.co.jp" }
  s.source           = { :git => "https://github.com/siagency/SIAAvoidKeyboardController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'SIAAvoidKeyboardController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
