Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "RestApiKit"
  spec.version      = "1.0.0"
  spec.summary      = "REST Api framework"

  spec.description  = "You can consume any REST API by using this framework"

  spec.homepage     = "https://github.com/rashidmustafa/RestApiKit"

  spec.license      = "MIT"

  spec.author             = { "Rashid mustafa" => "rashidmustafa07@gmail.com" }
  # Or just: spec.author    = "Rashid mustafa"
  # spec.authors            = { "Rashid mustafa" => "rashidmustafa07@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/_ras07"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  # spec.platform     = :ios, "15.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/rashidmustafa/RestApiKit.git", :tag => spec.version.to_s }

  spec.source_files  = "RestApiKit/**/*.{swift}"
  spec.swift_versions = "5.0"

end
