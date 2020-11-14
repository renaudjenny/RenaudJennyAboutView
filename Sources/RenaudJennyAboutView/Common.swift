import SwiftUI

public extension AboutView where Background == EmptyView {
    #if os(macOS)
    init(
        appId: String,
        @ViewBuilder logo: () -> Logo
    ) {
        self.init(
            appId: appId,
            logo: logo,
            background: { EmptyView() }
        )
    }
    #else
    init(
        appId: String,
        isInModal: Bool = false,
        @ViewBuilder logo: () -> Logo
    ) {
        self.init(
            appId: appId,
            isInModal: isInModal,
            logo: logo,
            background: { EmptyView() }
        )
    }
    #endif
}

internal extension AboutView {
    var developmentCredit: some View {
        VStack {
            Text("This application has been made by\nRenaud Jenny")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "@Renox0", url: .renox0Twitter)
        }
    }

    var openSourceCredit: some View {
        VStack {
            Text("Based on open source projects you can find on my GitHub")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "https://github.com/renaudjenny", url: .renaudjennyGithub)
        }
    }

    var iconsAndIllustrationsCredit: some View {
        VStack {
            Text("Icons and illustrations by\nMathilde Seyller")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "@myobriel", url: .myobrielInstagram)
        }
    }

    @ViewBuilder
    var rateThisApp: some View {
        if let appStoreUrl = try? URL.appStoreWriteReview(appId: appId) {
            WebLink(text: "Rate this application on the App Store", url: appStoreUrl)
                .multilineTextAlignment(.center)

        }
    }
}

struct WebLink: View {
    let text: String
    let url: URL

    var body: some View {
        Button(action: openURL) {
            Text(text)
        }
    }

    private func openURL() {
        #if os(macOS)
        NSWorkspace.shared.open(url)
        #else
        UIApplication.shared.open(url)
        #endif
    }
}

private extension URL {
    static var renox0Twitter: Self {
        guard let url = Self(string: "https://twitter.com/Renox0") else {
            fatalError("Cannot build the Twitter URL")
        }
        return url
    }

    static var renaudjennyGithub: Self {
        guard let url = Self(string: "https://github.com/renaudjenny") else {
            fatalError("Cannot build the Github URL")
        }
        return url
    }

    static var myobrielInstagram: Self {
        guard let url = Self(string: "https://www.instagram.com/myobriel") else {
            fatalError("Cannot build the instagram URL")
        }
        return url
    }

    static func appStoreWriteReview(appId: String) throws -> Self {
        guard let url = Self(string: "itms-apps://itunes.apple.com/app/\(appId)?action=write-review") else {
            #if DEBUG
            print("Cannot build the AppStore URL, hence the Rate this application is not shown")
            #endif
            throw URLFormattingError.cannotBuildAppStoreURLWithAppId(appId)
        }
        return url
    }
}

public enum URLFormattingError: Error {
    case cannotBuildAppStoreURLWithAppId(String)
}
