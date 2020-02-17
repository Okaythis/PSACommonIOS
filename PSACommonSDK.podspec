Pod::Spec.new do |spec|
  spec.name         = 'PSACommonSDK'
  spec.version      = '1.0.8'
  spec.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  spec.homepage     = 'https://okaythis.com'
  spec.author       = { 'Okay This' => 'hello@okaythis.com' }
  spec.summary      = 'SDK for encoding and decoding'
  spec.source       = { :http => 'https://github.com/Okaythis/PSACommonIOS/raw/ac93ae71756471e2ac48b07b09cbf88036e4f952/PSACommonSDK.zip' }
  spec.ios.deployment_target = '10.0'
  spec.ios.vendored_frameworks = 'PSACommon.framework'
end