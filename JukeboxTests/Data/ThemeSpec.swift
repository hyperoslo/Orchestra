import Quick
import Nimble
@testable import Jukebox

class ThemeSpec: QuickSpec {

  override func spec() {
    describe("Theme") {
      var theme: Theme!

      beforeEach {
        theme = Theme(
          name: "Amazing",
          audioFormat: "aiff")
      }

      describe("#bundlePrefix") {
        it("has a valid bundle prefix") {
          expect(Theme.bundlePrefix).to(equal("Jukebox-Sounds"))
        }
      }

      describe(".bundleName") {
        it("build bundle name based on prefix and theme name") {
          expect(theme.bundleName).to(equal("\(Theme.bundlePrefix)-\(theme.name)"))
        }
      }
    }
  }
}
