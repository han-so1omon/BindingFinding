import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct GoogleBook: Codable, Sendable {
    public let title: String
    public let authors: [String]?
}

public class GoogleBooksService {
    public init() {}

    struct SearchResponse: Codable {
        struct Item: Codable {
            struct VolumeInfo: Codable {
                let title: String
                let authors: [String]?
            }
            let volumeInfo: VolumeInfo
        }
        let items: [Item]?
    }

    public func searchBooks(query: String, completion: @Sendable @escaping ([GoogleBook]) -> Void) {
        guard let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(encoded)") else {
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let result = try? JSONDecoder().decode(SearchResponse.self, from: data) else {
                completion([])
                return
            }
            let books = result.items?.map { item in
                GoogleBook(title: item.volumeInfo.title, authors: item.volumeInfo.authors)
            } ?? []
            completion(books)
        }
        task.resume()
    }
}
