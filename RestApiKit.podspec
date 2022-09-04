Pod::Spec.new do |spec|
  spec.name         = "RestApiKit"
  spec.version      = "1.0.0"
  spec.summary      = "REST Api framework"
  spec.description  = "You can consume any REST API by using this framework"
  spec.homepage     = "https://github.com/rashidmustafa/RestApiKit"
  spec.license      = "MIT"
  spec.author       = { "Rashid mustafa" => "rashidmustafa07@gmail.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "15.0"
  spec.source       = { :git => "https://github.com/rashidmustafa/RestApiKit.git", :tag => spec.version.to_s }
  spec.source_files  = "RestApiKit/**/*.{swift}"
  spec.swift_versions = "5.0"

end
