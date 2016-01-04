import Foundation

struct Project {
  var id: Int
  var name: String
  var info: String
  var imageURL: NSURL
  var githubURL: NSURL

  // MARK: - Initializers

  init(id: Int, name: String, info: String, imageURL: NSURL, githubURL: NSURL) {
    self.id = id
    self.name = name
    self.info = info
    self.imageURL = imageURL
    self.githubURL = githubURL
  }

  // MARK: - Factory

  static var projects: [Project] {
    return [
      Project(id: 0, name: "Whisper",
        info: "A fairy eyelash or a unicorn whisper too far.",
        imageURL: NSURL(
          string: "https://raw.githubusercontent.com/hyperoslo/Whisper/master/Resources/whisper-cover.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Whisper")!),
      Project(id: 0, name: "ImagePicker",
        info: "ImagePicker is an all-in-one camera solution for your iOS app. It let's your users select images from the library and take pictures at the same time.",
        imageURL: NSURL(string: "https://raw.githubusercontent.com/hyperoslo/ImagePicker/master/Resources/ImagePickerIcon.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/ImagePicker")!),
      Project(id: 0, name: "Compass",
        info: "Compass helps you setup a central navigation system for your application.",
        imageURL: NSURL(string: "https://raw.githubusercontent.com/hyperoslo/Compass/master/Images/logo_v1.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Compass")!),
    ]
  }
}
