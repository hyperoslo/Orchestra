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
      Project(id: 0, name: "Form",
        info: "The most flexible and powerful way to build a form on iOS.",
        imageURL: NSURL(
          string: "https://raw.githubusercontent.com/hyperoslo/Form/master/Images/logo-v6.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Form")!),
      Project(id: 0, name: "Sync",
        info: "Modern JSON synchronization to Core Data",
        imageURL: NSURL(
          string: "https://raw.githubusercontent.com/hyperoslo/Sync/master/Images/logo-v2.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Sync")!),
      Project(id: 0, name: "Pages",
        info: "Pages is the easiest way of setting up a UIPageViewController.",
        imageURL: NSURL(string: "https://raw.githubusercontent.com/hyperoslo/Pages/master/Images/pages_logo.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Pages")!),
      Project(id: 0, name: "Presentation",
        info: "Presentation helps you to make tutorials, release notes and animated pages.",
        imageURL: NSURL(string: "https://raw.githubusercontent.com/hyperoslo/Presentation/master/Images/logo.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Presentation")!),
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
      Project(id: 0, name: "Cache",
        info: "Cache doesn't claim to be unique in this area, but it's not another monster library that gives you a god's power. It does nothing but caching, but it does it well.",
        imageURL: NSURL(
          string: "https://raw.githubusercontent.com/hyperoslo/Cache/master/Resources/CachePresentation.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Cache")!),
      Project(id: 0, name: "Hue",
        info: "Hue is the all-in-one coloring utility that you'll ever need.",
        imageURL: NSURL(
          string: "https://raw.githubusercontent.com/hyperoslo/Hue/master/Images/cover.png")!,
        githubURL: NSURL(string: "https://github.com/hyperoslo/Hue")!),
    ]
  }
}
