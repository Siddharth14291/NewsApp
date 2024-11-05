//
//  NewsListingViewModel.swift
//  News
//
//  Created by Siddharth Adhvaryu on 01/11/24.
//

import Foundation
import Combine

//
//  NewsListingViewModel.swift
//  News
//
//  Created by Siddharth Adhvaryu on 01/11/24.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    var articlesByCategory: [String: [Article]] = [:]

    func fetchPosts(category: String) {
        if let existingArticles = articlesByCategory[category] {
            articles = existingArticles
            return
        }
        
        isLoading = true
        
        guard let url = APIEndpoint.topHeadlines(category: category).url else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Get the data from the publisher
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
