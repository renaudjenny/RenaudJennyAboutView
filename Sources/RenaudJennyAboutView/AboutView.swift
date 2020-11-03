import SwiftUI

public struct AboutView<Logo: View>: View {
    let appId: String
    let logo: Logo

    public init(appId: String, @ViewBuilder logo: () -> Logo) {
        self.appId = appId
        self.logo = logo()
    }

    public var body: some View {
        ScrollView(.vertical) {
            HStack { Spacer() }
            logo
                .frame(width: 120, height: 120)
                .padding()
            VStack(spacing: 32) {
                developmentCredit
                openSourceCredit
                iconsAndIllustrationsCredit
                Text("Thank you for your support!")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                rateThisApp
            }.padding()
        }
        .navigationBarTitle("About")
    }

    private var developmentCredit: some View {
        VStack {
            Text("This application has been made by\nRenaud Jenny")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "@Renox0", url: .renox0Twitter)
        }
    }

    private var openSourceCredit: some View {
        VStack {
            Text("Based on open source projects you can find on my GitHub")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "https://github.com/renaudjenny", url: .renaudjennyGithub)
        }
    }

    private var iconsAndIllustrationsCredit: some View {
        VStack {
            Text("Icons and illustrations by\nMathilde Seyller")
                .multilineTextAlignment(.center)
                .font(.body)
            WebLink(text: "@myobriel", url: .myobrielInstagram)
        }
    }

    @ViewBuilder
    private var rateThisApp: some View {
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
        UIApplication.shared.open(url)
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

#if DEBUG
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView(appId: "id123456") {
                Image(systemName: "questionmark.circle")
                    .resizable()
            }
        }
    }
}
#endif
