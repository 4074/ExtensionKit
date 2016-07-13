Pod::Spec.new do |spec|
  spec.name         = "ExtensionKit"
  spec.version      = "0.1.1"
  spec.authors      = { "4074" => "never_wind@163.com" }
  spec.homepage     = "https://github.com/4074/ExtensionKit"
  spec.summary      = "Extensions in Swift"
  spec.source       = { :git => "https://github.com/4074/ExtensionKit.git" }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.platform     = :ios, '7.0'
  spec.source_files = "ExtensionKit/*.swift"

  spec.requires_arc = true

  spec.ios.deployment_target = '7.0'
  spec.ios.frameworks = ['UIKit', 'Foundation']
end