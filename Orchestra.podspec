Pod::Spec.new do |s|
  s.name             = "Orchestra"
  s.summary          = "A short description of Orchestra."
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/Orchestra"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/hyperoslo/Orchestra.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.resource_bundles = {
    'OrchestraSoundsHyper' => ['Sounds/Hyper/*.{aif}']
  }

  s.frameworks = 'UIKit', 'AVFoundation'
  s.dependency 'Sugar'
end
