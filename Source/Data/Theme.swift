public struct Theme {

  public let name: String
  public let bundleName: String
  public let audioFormat: String

  // MARK: - Initialization

  public init(name: String, bundleName: String, audioFormat: String) {
    self.name = name
    self.bundleName = bundleName
    self.audioFormat = audioFormat
  }
}
