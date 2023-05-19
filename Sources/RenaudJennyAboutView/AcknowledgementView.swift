import SwiftUI

struct AcknowledgementView: View {
    let libraries: [OpenSourceLibrary]

    var body: some View {
        List {
            Section("Open Source Libraries used in this project") {
                ForEach(libraries, id: \.url) { library in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(.init("[\(library.name)](\(library.url))")).font(.title2)
                        Text("By \(library.creator)").font(.headline)
                        Text(library.license)
                    }
                }
            }
        }
        .navigationTitle("Acknowledgement")
    }
}

#if DEBUG
struct AcknowledgementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AcknowledgementView(libraries: [.snapshotTesting, .snapshotTesting, .snapshotTesting])
        }
    }
}
#endif
