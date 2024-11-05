//
//  NewsListingViewModel.swift
//  News
//
//  Created by Siddharth Adhvaryu on 01/11/24.
//

import Foundation
import Combine

// Define the URLSessionProtocol
protocol URLSessionProtocol {
    func dataTaskPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}

// Extend URLSession to conform to the URLSessionProtocol
extension URLSession: URLSessionProtocol {
    func dataTaskPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return self.dataTaskPublisher(for: url)
    }
}


import Combine

class PostsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    var articlesByCategory: [String: [Article]] = [:]
    
    // Injected URLSession (default is URLSession.shared)
    private var urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchPosts(category: String) {
        if let existingArticles = articlesByCategory[category] {
            articles = existingArticles
            return
        }
        
        isLoading = true
        
        guard let url = APIEndpoint.topHeadlines(category: category).url else { return }

        urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RootClass.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }, receiveValue: { [weak self] root in
                self?.articlesByCategory[category] = root.articles ?? []
                self?.articles = root.articles ?? []
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
}
