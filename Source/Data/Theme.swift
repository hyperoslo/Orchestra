import Foundation

public struct Theme: Equatable {

  public static let bundlePrefix = "Jukebox-Sounds"

  public let name: String
  public let audioFormat: String

  public var bundleName: String {
    return "\(Theme.bundlePrefix)-\(name)"
  }

  // MARK: - Initialization

  public init(name: String, audioFormat: String) {
    self.name = name
    self.audioFormat = audioFormat
  }
}

public func ==(lhs: Theme, rhs: Theme) -> Bool {
  let equal = lhs.name == rhs.name &&
    lhs.audioFormat == rhs.audioFormat

  return equal
}
