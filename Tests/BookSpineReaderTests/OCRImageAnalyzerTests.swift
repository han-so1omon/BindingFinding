#if canImport(UIKit)
import XCTest
import UIKit
@testable import BookSpineReader

final class OCRImageAnalyzerTests: XCTestCase {
    func testRecognizeText() async throws {
        let image = Self.makeSampleImage()
        let analyzer = OCRImageAnalyzer()
        let expectation = XCTestExpectation(description: "Recognize text")
        var lines: [String] = []
        analyzer.recognizeText(from: image) { text in
            lines = text
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssert(lines.contains { $0.contains("Sample") })
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
#endif
