import XCTest
@testable import RenaudJennyAboutView
import SnapshotTesting

final class RenaudJennyAboutViewTests: XCTestCase {
    func testTheAboutView() {
        let previews = AboutView_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe)))
    }

    func testAboutViewInModal() {
        let previews = AboutViewInModal_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe)))
    }

    func testAboutViewInModalDarkMode() {
        let previews = AboutViewInModalDarkMode_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe)))
    }

    func testAboutViewInModalLandscape() {
        let previews = AboutViewInModalLandscape_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe(.landscape))))
    }

    func testAboutViewInModalWithBackground() {
        let previews = AboutViewInModalWithBackground_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe)))
    }

    func testAboutViewInModalWithBackgroundLandscape() {
        let previews = AboutViewInModalWithBackgroundLandscape_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe(.landscape))))
    }

    static var allTests = [
        ("testTheAboutView", testTheAboutView),
        ("testAboutViewInModal", testAboutViewInModal),
        ("testAboutViewInModalDarkMode", testAboutViewInModalDarkMode),
        ("testAboutViewInModalLandscape", testAboutViewInModalLandscape),
        ("testAboutViewInModalWithBackground", testAboutViewInModalWithBackground),
        ("testAboutViewInModalWithBackgroundLandscape", testAboutViewInModalWithBackgroundLandscape),
    ]
}
