import XCTest
@testable import RenaudJennyAboutView
import SnapshotTesting
import SwiftUI

final class RenaudJennyAboutViewTests: XCTestCase {
    #if !os(macOS)
    func testTheAboutView() {
        let previews = AboutView_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 800, height: 400)))
    }

    func testAboutViewInModal() {
        let previews = AboutViewInModal_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 800, height: 400)))
    }

    func testAboutViewInModalDarkMode() {
        let previews = AboutViewInModalDarkMode_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 800, height: 400)))
    }

    func testAboutViewInModalLandscape() {
        let previews = AboutViewInModalLandscape_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 400, height: 800)))
    }

    func testAboutViewInModalWithBackground() {
        let previews = AboutViewInModalWithBackground_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 800, height: 400)))
    }

    func testAboutViewInModalWithBackgroundLandscape() {
        let previews = AboutViewInModalWithBackgroundLandscape_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .fixed(width: 400, height: 800)))
    }
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
    #endif
}
