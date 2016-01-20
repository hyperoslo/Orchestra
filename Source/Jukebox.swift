import UIKit

public class Jukebox: NSObject {

  public static let engine = Jukebox()
  public static let defaultTheme = ThemeList.hyper

  public var autoPlay = false
  public private(set) var player: AudioPlayer

  public var theme = Jukebox.defaultTheme {
    didSet {
      player = AudioPlayer(theme: theme)
    }
  }

  var notificationCenter: NSNotificationCenter {
    return NSNotificationCenter.defaultCenter()
  }

  // MARK: - Initialization

  override init() {
    player = AudioPlayer(theme: theme)

    super.init()

    notificationCenter.addObserver(self,
      selector: "applicationDidBecomeActive",
      name: UIApplicationDidBecomeActiveNotification,
      object: nil)
  }

  deinit {
    notificationCenter.removeObserver(self)
  }

  // MARK: - Configuration

  public func reset() {
    autoPlay = false
    theme = Jukebox.defaultTheme
  }

  // MARK: - Player

  public func play(sound: Sound) throws -> Bool {
    return try player.play(sound)
  }

  func autoPlay(sound: Sound) {
    guard autoPlay else { return }

    player.playSafely(sound)
  }

  // MARK: - Notifications

  func applicationDidBecomeActive() {
    autoPlay(.Launch)
  }
}
