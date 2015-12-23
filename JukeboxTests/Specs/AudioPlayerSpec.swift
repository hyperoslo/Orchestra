import Quick
import Nimble
@testable import Jukebox

class AudioPlayerSpec: QuickSpec {

  override func spec() {
    describe("AudioPlayer") {
      var audioPlayer: AudioPlayer!
      let theme = Theme(
        name: "Amazing",
        audioFormat: "aiff")

      beforeEach {
        audioPlayer = AudioPlayer(theme: theme)
      }
    }
  }
}
