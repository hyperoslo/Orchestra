public class Jukebox {

  public static let engine = Jukebox()
  public static let defaultTheme = ThemeList.hyper

  public private(set) var player: AudioPlayer

  public var autoPlay = false

  public var theme = Jukebox.defaultTheme {
    didSet {
      player = AudioPlayer(theme: theme)
    }
  }

  // MARK: - Initialization

  init() {
    player = AudioPlayer(theme: theme)
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
}
