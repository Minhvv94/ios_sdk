Pod::Spec.new do |spec|
  spec.name         = 'ios_sdk'
  spec.platform     = :ios, '13.0'
  spec.summary      = 'vtvlive lib itapsdk'
  spec.requires_arc = true
  spec.version      = '1.0'
  spec.module_name  = 'ios_sdk'
  spec.authors      = { 'Minhvv' => 'minhvv@vtvlive.vn' }
  spec.homepage     = 'https://github.com/Minhvv94/libITapSdk'
  spec.source       = { 'http' => 'https://cdn.onplay.live/sdk/ios/ios_sdk.framework.zip'}
  spec.source_files = 'ios_sdk.framework/*'
  spec.vendored_frameworks = 'ios_sdk.framework'
  spec.swift_version = '5.0'
  spec.swift_versions = '5.0'
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  spec.framework = 'UIKit'
  spec.framework = 'AdSupport'
  spec.framework = 'AppTrackingTransparency'
  spec.framework = 'AudioToolbox'
  spec.framework = 'iAd'
  spec.framework = 'Security'
  spec.framework = 'WebKit'


  spec.dependency 'Alamofire', '~> 5.6.2'
  spec.dependency 'RxSwift', '~> 6.0.0'
  spec.dependency 'SwiftyJSON', '~> 5.0.0'
end
