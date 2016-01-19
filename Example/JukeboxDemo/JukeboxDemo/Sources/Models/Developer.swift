import Foundation

struct Developer {
  var id: Int
  var name: String
  var imageURL: NSURL
  var githubURL: NSURL

  // MARK: - Initializers

  init(id: Int, name: String, imageURL: NSURL, githubURL: NSURL) {
    self.id = id
    self.name = name
    self.imageURL = imageURL
    self.githubURL = githubURL
  }

  // MARK: - Factory

  static var developers: [Developer] {
    return [
      Developer(id: 0, name: "Christoffer Winterkvist",
        imageURL: NSURL(string: "https://avatars2.githubusercontent.com/u/57446?v=3&s=460")!,
        githubURL: NSURL(string: "https://github.com/zenangst")!),
      Developer(id: 0, name: "Ramon Gilabert",
        imageURL: NSURL(string: "https://avatars1.githubusercontent.com/u/6138120?v=3&s=460")!,
        githubURL: NSURL(string: "https://github.com/RamonGilabert")!),
      Developer(id: 0, name: "Vadym Markov",
        imageURL: NSURL(string: "https://avatars2.githubusercontent.com/u/10529867?v=3&s=460")!,
        githubURL: NSURL(string: "https://github.com/vadymmarkov")!)
    ]
  }
}
