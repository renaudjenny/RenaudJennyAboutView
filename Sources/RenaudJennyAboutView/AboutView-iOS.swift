import SwiftUI

#if os(iOS)
public struct AboutView<Logo: View, Background: View>: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode

    let appId: String
    let logo: Logo
    let isInModal: Bool
    let openSourceLibraries: [OpenSourceLibrary]
    var background: Background

    public init(
        appId: String,
        isInModal: Bool = false,
        openSourceLibraries: [OpenSourceLibrary] = [.snapshotTesting],
        @ViewBuilder logo: () -> Logo,
        @ViewBuilder background: () -> Background
    ) {
        self.appId = appId
        self.isInModal = isInModal
        self.openSourceLibraries = openSourceLibraries
        self.logo = logo()
        self.background = background()
    }

    public var body: some View {
        ScrollView(.vertical) {
            HStack { Spacer() }
            if isInModal {
                if verticalSizeClass == .regular {
                    closeCapsule
                } else {
                    HStack {
                        Spacer()
                        Button(action: close) {
                            Text("Done", bundle: Bundle.module)
                        }.padding()
                    }
                }
            }
            VStack {
                logo.padding()
                VStack(spacing: 32) {
                    developmentCredit
                    openSourceCredit
                    iconsAndIllustrationsCredit
                    Text("Thank you for your support!", bundle: Bundle.module)
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    rateThisApp
                }
                .padding()

            }
            .background(background)
        }
        .navigationTitle(NSLocalizedString("About", bundle: Bundle.module, comment: "Title"))
    }

    private func close() {
        presentationMode.wrappedValue.dismiss()
    }

    private var closeCapsule: some View {
        Capsule(style: .circular)
            .fill(
                colorScheme == .light
                    ? Color.black.opacity(1/4)
                    : Color.white.opacity(1/4)
            )
            .frame(width: 50, height: 5)
    }
}

#if DEBUG
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView(appId: "id123456") {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
        }
    }
}

struct AboutViewInModal_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456", isInModal: true) {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        }
        .environment(\.verticalSizeClass, .regular)
    }
}

struct AboutViewInModalDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456", isInModal: true) {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
        .colorScheme(.dark)
        .environment(\.verticalSizeClass, .regular)
    }
}

struct AboutViewInModalLandscape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView(appId: "id123456", isInModal: true) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
            .previewLayout(.fixed(width: 568, height: 320))
            .environment(\.verticalSizeClass, .compact)
        }
    }
}

struct AboutViewInModalWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456", isInModal: true) {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        } background: {
            Color.red.opacity(1/10)
                .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .environment(\.verticalSizeClass, .regular)
    }
}

struct AboutViewInModalWithBackgroundLandscape_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(appId: "id123456", isInModal: true) {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
        } background: {
            Color.red.opacity(1/10)
                .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .previewLayout(.fixed(width: 568, height: 320))
        .environment(\.verticalSizeClass, .compact)
    }
}

struct AboutViewFrench_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView(appId: "id123456") {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
        }
        .environment(\.locale, .init(identifier: "fr"))
    }
}
#endif
#endif
