public struct Theme {

  public let bundleName: String
  public let audioFormat: String

  // MARK: - Initialization

  public init(bundleName: String, audioFormat: String) {
    self.bundleName = bundleName
    self.audioFormat = audioFormat
  }
}
