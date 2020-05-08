Pod::Spec.new do |s|
  s.name          = "FKTools"
  s.version       = "1.0.0"
  s.summary       = "Infrequently used but useful tools"
  s.homepage      = "https://github.com/SYFH/FKTools"
  s.license       = "MIT"
  s.author        = { "norld" => "syfh@live.com" }
  s.platform      = :ios, "9.0"
  s.source        = { :git => "https://github.com/SYFH/FKTools.git", :tag => "#{s.version}" }
  s.source_files  = "FKTools/Resource/**/*.{h,m}"
  s.exclude_files = "FKTools/*.plist"
  s.requires_arc  = true
  s.static_framework = true
end
