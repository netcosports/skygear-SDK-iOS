Pod::Spec.new do |s|
  s.name             = "SKYKit"
  s.version          = "1.7.1.3"
  s.summary          = "iOS SDK for Skygear"
  s.description      = <<-DESC
                       This is the client library for Skygear backend.
                       DESC
  s.homepage         = "https://github.com/SkygearIO/skygear-SDK-iOS"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Oursky Ltd." => "hello@oursky.com" }
  s.source           = { :git => "https://github.com/netcosports/skygear-SDK-iOS.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.default_subspecs = 'Core', 'Core-Swift', 'ForgotPassword', 'SSO'

  s.subspec 'Core' do |core|
    core.requires_arc = true
    core.ios.deployment_target = '8.0'
    core.osx.deployment_target = '10.10'

    core.source_files = 'Pod/Classes/**/*.{h,m}'
    core.private_header_files = 'Pod/Classes/**/*_Private.h'

    core.dependency 'SocketRocket', '~> 0.4'
    core.dependency 'MagicKit-Skygear', '~> 0.0.7'
    core.dependency 'XMLDictionary', '~> 1.4.1'
    core.dependency 'UICKeyChainStore', '~> 2.1.0'
  end

  s.subspec 'Core-Swift' do |core|
    core.source_files = 'Pod/Classes/**/*.{swift}'

    core.dependency 'SKYKit/Core'
  end

  s.subspec 'Facebook' do |facebook|
    facebook.ios.deployment_target = '8.0'

    facebook.source_files = 'Pod/Extensions/Facebook/**/*.{h,m}'
    facebook.requires_arc = true
    # Allow the weak linking to Bolts (see FBSDKAppLinkResolver.h) in Cocoapods 0.39.0
    facebook.pod_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

    facebook.dependency 'SKYKit/Core'
    facebook.dependency 'FBSDKCoreKit', '~> 4.0'
  end

  s.subspec 'ForgotPassword' do |forgotPassword|
    forgotPassword.ios.deployment_target = '8.0'

    forgotPassword.source_files = 'Pod/Extensions/Forgot Password/**/*.{h,m}'
    forgotPassword.requires_arc = true

    forgotPassword.dependency 'SKYKit/Core'
  end

  s.subspec 'SSO' do |sso|
    sso.ios.deployment_target = '8.0'

    sso.source_files = 'Pod/Extensions/SSO/**/*.{h,m}'
    sso.requires_arc = true

    sso.dependency 'SKYKit/Core'
  end
end
