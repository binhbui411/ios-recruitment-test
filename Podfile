source 'https://github.com/CocoaPods/Specs.git'

platform :ios, "10.0"

inhibit_all_warnings!
use_frameworks!

def import_common_pods
  pod 'Alamofire'
  pod 'AlamofireObjectMapper'
  pod 'ObjectMapper'
  pod 'SDWebImage'
  pod 'KVNProgress'
  pod 'MMDrawerController'
  pod 'IQKeyboardManager'

end

target 'iOSRecruitmentTest' do
  import_common_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
