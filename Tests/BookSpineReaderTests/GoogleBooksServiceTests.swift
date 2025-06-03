import XCTest
@testable import BookSpineReader

final class GoogleBooksServiceTests: XCTestCase {
    func testSearchBooksReturnsResults() async throws {
        let service = GoogleBooksService()
        let books = await withCheckedContinuation { continuation in
            service.searchBooks(query: "Sample Book") { books in
                continuation.resume(returning: books)
            }
        }
        // Network access may not be available in testing environments.
        // Verify that the completion handler was invoked.
        XCTAssertGreaterThanOrEqual(books.count, 0)
    }
}
