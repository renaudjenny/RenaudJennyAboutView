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
        Text(
            "This application has been made by [Renaud Jenny](https://pouet.chapril.org/@renaudjenny)",
            bundle: Bundle.module
        )
        .multilineTextAlignment(.center)
        .font(.body)
    }

    var openSourceCredit: some View {
        Text(
            "Based on open source projects you can find on my [GitHub](https://github.com/renaudjenny)",
            bundle: Bundle.module
        )
        .multilineTextAlignment(.center)
        .font(.body)
    }

    var iconsAndIllustrationsCredit: some View {
        Text(
            "Icons and illustrations by [Mathilde Seyller](https://www.instagram.com/myobriel)",
            bundle: Bundle.module
        )
        .multilineTextAlignment(.center)
        .font(.body)
    }

    var rateThisApp: some View {
        Text(
            .init("[Rate this application on the App Store](itms-apps://itunes.apple.com/app/\(appId)?action=write-review)"),
            bundle: Bundle.module,
            comment: "Rate this app button"
        )
        .multilineTextAlignment(.center)
        .font(.callout)
    }

    var openSourcePackages: some View {
        Text("TODO")
    }
}
