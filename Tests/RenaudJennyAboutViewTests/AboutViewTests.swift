import XCTest
@testable import RenaudJennyAboutView
import SnapshotTesting
import SwiftUI

final class RenaudJennyAboutViewTests: XCTestCase {
    #if !os(macOS)
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

    #else
    func testTheAboutViewMacOS() {
        let previews = AboutView_Previews.previews
        let viewController = NSHostingView(rootView: previews)
        viewController.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        assertSnapshot(matching: viewController, as: .image)
    }

    func testAboutViewWithBackground() {
        let previews = AboutViewWithBackground_Previews.previews
        let viewController = NSHostingView(rootView: previews)
        viewController.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        assertSnapshot(matching: viewController, as: .image)
    }

    static var allTests = [
        ("testTheAboutViewMacOS", testTheAboutViewMacOS),
        ("testAboutViewWithBackground", testAboutViewWithBackground),
    ]
    #endif
}
