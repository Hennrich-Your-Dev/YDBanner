#
#  Be sure to run `pod spec lint YDBanner.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "YDLiveBanner"
  spec.version      = "1.0.0"
  spec.summary      = "Product for B2W."
  spec.homepage     = "https://yourdev.com.br"
  spec.license      = "MIT"
  spec.author       = { "Douglas Hennrich" => "douglashennrich@yourdev.com.br" }
  spec.platform     = :ios, "11.0"

  spec.source       		= { :git => "https://github.com/Hennrich-Your-Dev/YDBanner.git", :tag => spec.version }
  spec.source_files     = "YDLiveBanner/**/*.{h,m,swift,xib}"
  spec.swift_version    = "5.0"

	spec.dependency				"Kingfisher", "~> 5.0"

end
