Pod::Spec.new do |s|
  s.name             = 'FalconMetrics'
  s.version          = '0.2.4'
  s.summary          = 'FalconMetrics iOS SDK'
  s.description      = <<-DESC
FalconMetrics SDK for iOS applications. Provides precise mobile ad attribution for iOS apps.
                       DESC
  s.homepage         = 'https://www.falconmetrics.io'
  s.license          = { :type => 'Custom', :text => 'FalconMetrics SDK License Addendum. This SDK is licensed, not sold. By downloading, integrating, or using this SDK, you agree to the FalconMetrics Terms of Use and SDK License Addendum located at: https://www.falconmetrics.io/terms' }
  s.author           = { 'FalconMetrics' => 'support@falconmetrics.io' }
  s.source           = { :http => 'https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.2.2/FalconMetricsSDK.xcframework.zip', 
                         :sha256 => '3933aac73b5253a4a579f855df4642a22206c9a2178ea2361d91b01bdaebbf8a' }
  
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.7'
  
  # This command runs after the pod is downloaded. It renames the xcframework
  # to match the module name, which solves the linker issue.
  s.prepare_command = <<-CMD
    mv FalconMetricsSDK.xcframework FalconMetrics.xcframework
  CMD

  s.vendored_frameworks = 'FalconMetrics.xcframework'

  # Exclude i386 architecture while supporting arm64 for M1/M2 simulators
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
