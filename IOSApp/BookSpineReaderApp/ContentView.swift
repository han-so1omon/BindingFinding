import SwiftUI

struct ContentView: View {
    @Binding var recognizedText: [String]

    var body: some View {
        VStack {
            Text("Recognized Text:")
                .font(.headline)
            ScrollView {
                ForEach(recognizedText, id: \.self) { line in
                    Text(line)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(recognizedText: .constant(["Sample Book", "Author"]))
}
