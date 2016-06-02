#
# Be sure to run `pod lib lint FBPLUGIN.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FBPLUGIN"
  s.version          = "0.5.6"
  s.summary          = "Plugin for Facebook intergration"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                           Useful plugin for Facebook login and request information with fews line of code
                       DESC

  s.homepage         = "https://github.com/tthufo"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "thanhhaitran" => "tthufo@gmail.com" }
  s.source           = { :git => "https://github.com/tthufo/FBPLUGIN.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tthufo'

  s.platform     = :ios, '7.0'

#  s.ios.deployment_target = '7.0'

#  s.watchos.deployment_target = '2.0'

  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.resource_bundles = {
    'FBPLUGIN' => ['Pod/Assets/*']
  }

  s.resources = 'Pod/Assets/*.*'

  s.frameworks = 'CoreData'

  s.public_header_files = 'Pod/Classes/*.h'

s.dependency 'FBSDKCoreKit', '~> 4.4'
s.dependency 'FBSDKLoginKit', '~> 4.4'
s.dependency 'FBSDKShareKit', '~> 4.4'
s.dependency 'AVHexColor', '~> 2.0'
s.dependency 'SVProgressHUD'
s.dependency 'Toast', '~> 2.4'
s.dependency 'ASIHTTPRequest', '~> 1.8'
s.dependency 'JSONKit-NoWarning', '~> 1.2'
s.dependency 'SDWebImage', '~> 3.7'
s.dependency 'hpple', '~> 0.2'
s.dependency 'IAPHelper'
s.dependency 'JCNotificationBannerPresenter', '~> 1.1'

end
