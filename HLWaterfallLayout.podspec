Pod::Spec.new do |s|

  s.name         = "HLWaterfallLayout"
  s.version      = "1.0.0"
  s.summary      = "a simple waterfall flow layout with 12 Animation"

  s.homepage     = "https://github.com/henvyluk/HLWaterfallLayout"

  s.license      = "MIT"

  s.author       = { "henvyluk" => "henvyluk@163.com" }

  s.social_media_url ="http://www.jianshu.com/users/296956170537/latest_articles"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/henvyluk/HLWaterfallLayout.git", :tag => s.version }

  s.source_files  = "Classes/*.{h,m}"

  s.requires_arc = true

end
