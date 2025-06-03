import SwiftUI
import BookSpineReader
import UIKit

@main
struct BookSpineReaderApp: App {
    var reader = BookSpineReader()
    @State private var recognizedText: [String] = []

    var body: some Scene {
        WindowGroup {
            ContentView(recognizedText: $recognizedText)
                .task {
                    let image = Self.makeSampleImage()
                    reader.ocr.recognizeText(from: image) { text in
                        recognizedText = text
                    }
                }
        }
    }

    static func makeSampleImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 100))
        return renderer.image { ctx in
            UIColor.white.setFill()
            ctx.fill(CGRect(origin: .zero, size: CGSize(width: 300, height: 100)))
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 24),
                .paragraphStyle: paragraph,
                .foregroundColor: UIColor.black
            ]
            let string = "Sample Book"
            string.draw(in: CGRect(x: 0, y: 35, width: 300, height: 30), withAttributes: attrs)
        }
    }
}
