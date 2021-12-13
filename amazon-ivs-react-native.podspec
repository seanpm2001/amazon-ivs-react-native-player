require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

File.open("ios/AmazonIvsManager+Framework.swift", "w") { |f|
  f.write <<-IVS
extension AmazonIvsManager {
  @objc public static let frameworkName = "reactnative"
  @objc public static let frameworkVersion = "#{package["version"]}"
}
IVS
}

Pod::Spec.new do |s|
  s.name         = "amazon-ivs-react-native"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/aws/amazon-ivs-react-native.git", :tag => "#{s.version}" }


  s.source_files = "ios/**/*.{h,m,mm,swift}"


  s.dependency "React-Core"
  s.dependency "AmazonIVSPlayer", "~> 1.6.0"
end
