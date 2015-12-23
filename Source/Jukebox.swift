public struct Jukebox {

  public private(set) static var player = AudioPlayer()

  public static var theme: String = "default" {
    didSet {
      
    }
  }
}
