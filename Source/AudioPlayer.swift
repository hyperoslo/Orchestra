import AVFoundation

public class AudioPlayer {

  var player: AVAudioPlayer?

  var session: AVAudioSession {
    return AVAudioSession.sharedInstance()
  }

  public func play(sound: Sound) throws {
    try session.setCategory(AVAudioSessionCategoryPlayback)
    try session.setActive(true)

    let bundle = NSBundle.mainBundle()

    guard let path = bundle.pathForResource(sound.rawValue, ofType: "aiff") else {
      return
    }

    let URL = NSURL(fileURLWithPath: path)

    player = try AVAudioPlayer(contentsOfURL: URL)
    player?.prepareToPlay()
    player?.play()
  }
}
