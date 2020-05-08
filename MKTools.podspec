Pod::Spec.new do |s|
  s.name          = "MKTools"
  s.version       = "1.0.0"
  s.summary       = "Infrequently used but useful tools"
  s.homepage      = "https://github.com/SYFH/MKTools"
  s.license       = "MIT"
  s.author        = { "norld" => "syfh@live.com" }
  s.platform      = :ios, "9.0"
  s.source        = { :git => "https://github.com/SYFH/MKTools.git", :tag => "#{s.version}" }
  s.source_files  = "MKTools/Resource/**/*.{h,m}"
  s.exclude_files = "MKTools/*.plist"
  s.requires_arc  = true
  s.static_framework = true
end
