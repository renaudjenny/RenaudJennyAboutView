import XCTest
@testable import RenaudJennyAboutView
import SnapshotTesting

final class RenaudJennyAboutViewTests: XCTestCase {
    func testTheAboutView() {
        let previews = AboutView_Previews.previews
        assertSnapshot(matching: previews, as: .image(layout: .device(config: .iPhoneSe)))
    }

    static var allTests = [
        ("testTheAboutView", testTheAboutView),
    ]
}
