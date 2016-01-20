import Quick
import Nimble
@testable import Jukebox

class JukeboxSpec: QuickSpec {

  override func spec() {
    describe("Jukebox") {
      var engine: Jukebox!
      let defaultTheme = ThemeList.hyper
      let amazingTheme = Theme(name: "Amazing", audioFormat: "aiff")

      beforeEach {
        engine = Jukebox()
      }

      describe("#defaultTheme") {
        it("has a valid default theme") {
          expect(Jukebox.defaultTheme).to(equal(defaultTheme))
        }
      }

      describe("#player") {
        it("uses a default theme") {
          expect(engine.player.theme).to(equal(Jukebox.defaultTheme))
        }
      }

      describe("#autoPlay") {
        it("is enabled by default") {
          expect(engine.autoPlay).to(beFalse())
        }
      }

      describe("#theme") {
        it("has a valid default theme") {
          expect(engine.theme).to(equal(Jukebox.defaultTheme))
        }

        it("sets a new theme to the player") {
          engine.theme = amazingTheme

          expect(engine.theme).to(equal(amazingTheme))
          expect(engine.player.theme).to(equal(engine.theme))
        }
      }

      describe("#reset") {
        it("restores defaults") {
          engine.theme = amazingTheme
          engine.autoPlay = true

          engine.reset()

          expect(engine.theme).to(equal(Jukebox.defaultTheme))
          expect(engine.autoPlay).to(beFalse())
        }
      }
    }
  }
}
