// Core library entry point
public struct BookSpineReader {
    public init() {}

    public let ocr = OCRImageAnalyzer()
    public let service = GoogleBooksService()
}
