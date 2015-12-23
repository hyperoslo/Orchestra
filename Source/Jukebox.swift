public struct Jukebox {

  public private(set) static var player = AudioPlayer(theme: theme)

  public static var theme: Theme = .Hyper {
    didSet {
      player = AudioPlayer(theme: theme)
    }
  }
}
