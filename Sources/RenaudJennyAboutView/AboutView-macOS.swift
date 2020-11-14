import SwiftUI

#if os(macOS)
public struct AboutView<Logo: View, Background: View>: View {
    @Environment(\.colorScheme) var colorScheme

    let appId: String
    let logo: Logo
    var background: Background

    public init(
        appId: String,
        @ViewBuilder logo: () -> Logo,
        @ViewBuilder background: () -> Background
    ) {
        self.appId = appId
        self.logo = logo()
        self.background = background()
    }

    public var body: some View {
        VStack {
            logo
            developmentCredit
            openSourceCredit
            iconsAndIllustrationsCredit
            Text("Thank you for your support!")
                .multilineTextAlignment(.center)
                .font(.headline)
            rateThisApp
        }
        .padding()
        .background(background)
        .navigationTitle("About")
    }
}

#if DEBUG
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456") {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        }
    }
}

struct AboutViewWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456") {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        } background: {
            Color.red.opacity(1/10)
        }
    }
}
#endif
#endif
