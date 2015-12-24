import Quick
import Nimble
@testable import Jukebox

class AudioPlayerSpec: QuickSpec {

  override func spec() {
    describe("AudioPlayer") {
      var audioPlayer: AudioPlayer!

      context("when a theme bundle is not found") {
        beforeEach {
          let theme = Theme(
            name: "Amazing",
            audioFormat: "aiff")

          audioPlayer = AudioPlayer(theme: theme)
        }

        describe(".play") {
          it("should throw theme bundle not found error") {
            expect { try audioPlayer.play(.Back)}.to(
              throwError(AudioPlayer.Error.ThemeBundleNotFound))
            expect(audioPlayer.player).to(beNil())
          }
        }

        describe(".playSafely") {
          it("shouldn't start playing") {
            let result = audioPlayer.playSafely(.Back)
            expect(result).to(beFalse())
          }
        }

        describe(".resume") {
          it("shouldn't resume") {
            let result = audioPlayer.resume()
            expect(result).to(beFalse())
          }
        }

        describe(".stop") {
          it("shouldn't stop") {
            let result = audioPlayer.stop()
            expect(result).to(beFalse())
            expect(audioPlayer.player).to(beNil())
          }
        }

        describe(".pause") {
          it("shouldn't pause") {
            let result = audioPlayer.pause()
            expect(result).to(beFalse())
          }
        }
      }
    }
  }
}
