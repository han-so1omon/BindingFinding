import Foundation
#if canImport(Vision)
import Vision
import UIKit
#endif

public struct RecognizedBook {
    public let title: String
    public let authors: [String]
}

public class OCRImageAnalyzer {
    public init() {}

#if canImport(Vision)
    public func recognizeText(from image: UIImage, completion: @escaping ([String]) -> Void) {
        let request = VNRecognizeTextRequest { request, error in
            let texts = (request.results as? [VNRecognizedTextObservation])?.compactMap { observation in
                observation.topCandidates(1).first?.string
            } ?? []
            completion(texts)
        }
        request.recognitionLevel = .accurate
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                completion([])
            }
        }
    }
#else
    // Fallback for non iOS platforms. Returns empty results.
    public func recognizeText(from data: Data, completion: @escaping ([String]) -> Void) {
        completion([])
    }
#endif
}
