Pod::Spec.new do |spec|
  spec.name         = 'PSACommonSDK'
  spec.version      = '1.0.7'
  spec.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  spec.homepage     = 'https://okaythis.com'
  spec.author       = { 'Okay This' => 'hello@okaythis.com' }
  spec.summary      = 'SDK for encoding and decoding'
  spec.source       = { :http => 'https://github.com/Okaythis/PSACommonIOS/raw/1.0.7/PSACommon.zip' }
  spec.ios.deployment_target = '10.0'
  spec.ios.vendored_frameworks = 'PSACommon.framework'
end