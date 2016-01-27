import Quick
import Nimble
@testable import Orchestra

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
          expect(Theme.bundlePrefix).to(equal("OrchestraSounds"))
        }
      }

      describe(".bundleName") {
        it("build bundle name based on prefix and theme name") {
          expect(theme.bundleName).to(equal("\(Theme.bundlePrefix)\(theme.name)"))
        }
      }

      describe("==") {
        it("is true when themes are equal") {
          let theme1 = Theme(
            name: "Amazing",
            audioFormat: "aiff")

          expect(theme).to(equal(theme1))
        }

        it("is false when themes are not equal") {
          let theme1 = Theme(
            name: "Amazing",
            audioFormat: "wav")

          let theme2 = Theme(
            name: "Unknown",
            audioFormat: "aiff")

          expect(theme).toNot(equal(theme1))
          expect(theme).toNot(equal(theme2))
        }
      }
    }
  }
}
