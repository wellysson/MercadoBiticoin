#source 'https://github.com/CocoaPods/Specs.git'
project 'QueroSerMB.xcodeproj'
# Pods project - minimum deployment target
platform :ios, '10.0'
use_frameworks!

target 'QueroSerMB' do
    pod 'SwiftyJSON', '~> 4.3.0'
    pod 'lottie-ios', '3.2.3'
    pod 'SDWebImage', '5.12.0'
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
