Pod::Spec.new do |s|
  s.name             = "Jukebox"
  s.summary          = "A short description of Jukebox."
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/Jukebox"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/hyperoslo/Jukebox.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.resource_bundles = {
    'JukeboxSoundsHyper' => ['JukeboxSounds/Hyper/*.{aif}']
  }

  s.frameworks = 'UIKit', 'AVFoundation'
end
