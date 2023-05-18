public struct OpenSourceLibrary {
    let name: String
    let creator: String
    let license: String
    let url: String

    public init(name: String, creator: String, license: String, url: String) {
        self.name = name
        self.creator = creator
        self.license = license
        self.url = url
    }
}

public extension OpenSourceLibrary {
    static let snapshotTesting = Self(
        name: "SnapshotTesting",
        creator: "Point-Free, Inc",
        license: "MIT License",
        url: "https://github.com/pointfreeco/swift-snapshot-testing"
    )
}
