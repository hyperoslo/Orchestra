public class Jukebox {

  public static let defaultTheme = ThemeList.hyper
  public private(set) static var player = AudioPlayer(theme: theme)

  // MARK: - Configuration

  public static var autoPlay = true

  public static var theme: Theme = defaultTheme {
    didSet {
      player = AudioPlayer(theme: theme)
    }
  }

  public static func reset() {
    autoPlay = true
    theme = defaultTheme
  }
}
