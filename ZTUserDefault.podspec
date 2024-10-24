Pod::Spec.new do |s|
  s.name             = 'ZTUserDefault'
  s.version          = '1.0.2'
  s.summary          = 'A lightweight Swift library that provides convenient way to manage UserDefaults with support for reactive programming using Combine. '

  s.description      = <<-DESC
                        ZTUserDefault is a lightweight Swift library that provides a powerful and convenient way to manage UserDefaults with support for reactive programming using Combine. The library simplifies the process of storing, retrieving, and observing changes to UserDefaults, while supporting custom Codable types.
                        DESC

  s.homepage         = 'https://github.com/willonboy/ZTUserDefault'
  s.license          = { :type => 'MPL-2.0', :file => 'LICENSE' }
  s.author           = { 'trojan zhang' => 'willonboy@qq.com' }
  s.source           = { :git => 'https://github.com/willonboy/ZTUserDefault.git', :tag => s.version.to_s }

  s.source_files = 'Sources/**/*.{swift,h,m}'
  s.exclude_files = 'Sources/Exclude'

  # s.platforms = { :ios => '13.0', :macos => '10.15' }
  s.platforms = { :ios => '13.0' }

  s.swift_version = '5.2'

end
