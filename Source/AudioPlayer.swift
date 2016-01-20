import AVFoundation
import Sugar

public class AudioPlayer: NSObject {

  public enum Error: ErrorType {
    case ThemeBundleNotFound
    case FrameworkBundleNotFound
    case SoundNotFound
  }

  public let theme: Theme
  var player: AVAudioPlayer?

  var session: AVAudioSession {
    return AVAudioSession.sharedInstance()
  }

  // MARK: - Initialization

  public required init(theme: Theme) {
    self.theme = theme
    super.init()
  }

  // MARK: - Start playback

  public func play(sound: Sound) throws -> Bool {
    guard player?.playing != true else {
      return false
    }

    let bundle = NSBundle(forClass: AudioPlayer.self)

    guard let resourcePath = bundle.resourcePath else {
      throw Error.FrameworkBundleNotFound
    }

    let soundsBundlePath = resourcePath + "/\(theme.bundleName).bundle"

    guard let soundsBundle = NSBundle(path: soundsBundlePath) else {
      throw Error.ThemeBundleNotFound
    }

    guard let soundPath = soundsBundle.pathForResource(sound.rawValue, ofType: theme.audioFormat) else {
      throw Error.SoundNotFound
    }

    let URL = NSURL(fileURLWithPath: soundPath)

    try session.setCategory(AVAudioSessionCategoryPlayback)
    try session.setActive(true)

    player = try AVAudioPlayer(contentsOfURL: URL)
    player?.prepareToPlay()

    return player?.play() == true
  }

  public func playSafely(sound: Sound) -> Bool {
    do {
      return try play(sound)
    } catch {
      print(error)
    }

    return false
  }

  public func resume() -> Bool {
    guard let player = player where !player.playing else {
      return false
    }

    return player.play()
  }

  // MARK: - Stop playback

  public func stop() {
    player?.volume = 0

    delay(0.5) { [weak self] in
      guard let weakSelf = self else { return }

      weakSelf.player?.stop()
      weakSelf.player?.currentTime = 0
      weakSelf.player = nil
    }
  }

  public func pause() -> Bool {
    guard let player = player where player.playing else {
      return false
    }

    player.pause()

    return true
  }
}

extension AudioPlayer: AVAudioPlayerDelegate {

  public func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
    stop()
  }
}
