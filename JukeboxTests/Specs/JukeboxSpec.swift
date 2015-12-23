import Quick
import Nimble
@testable import Jukebox

class JukeboxSpec: QuickSpec {

  override func spec() {
    describe("Jukebox") {
      let defaultTheme = ThemeList.hyper
      let amazingTheme = Theme(
        name: "Amazing",
        audioFormat: "aiff")

      beforeEach {
        Jukebox.reset()
      }

      describe("#defaultTheme") {
        it("has a valid default theme") {
          expect(Jukebox.defaultTheme).to(equal(defaultTheme))
        }
      }

      describe("#player") {
        it("uses a default theme") {
          expect(Jukebox.player.theme).to(equal(Jukebox.defaultTheme))
        }
      }

      describe("#autoPlay") {
        it("is enabled by default") {
          expect(Jukebox.autoPlay).to(beTrue())
        }
      }

      describe("#theme") {
        it("has a valid default theme") {
          expect(Jukebox.theme).to(equal(Jukebox.defaultTheme))
        }

        it("sets a new theme to the player") {
          Jukebox.theme = amazingTheme

          expect(Jukebox.theme).to(equal(amazingTheme))
          expect(Jukebox.player.theme).to(equal(Jukebox.theme))
        }
      }

      describe("#reset") {
        it("restores defaults") {
          Jukebox.theme = amazingTheme
          Jukebox.autoPlay = false

          Jukebox.reset()

          expect(Jukebox.theme).to(equal(Jukebox.defaultTheme))
          expect(Jukebox.autoPlay).to(beTrue())
        }
      }
    }
  }
}
