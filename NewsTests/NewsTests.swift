//
//  NewsTests.swift
//  NewsTests
//
//  Created by Siddharth Adhvaryu on 05/11/24.
//

import Testing
import XCTest
import Combine
import Foundation
@testable import News

class PostsViewModelTests: XCTestCase {
    
    var viewModel: PostsViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchPostsRealData() {
        let category = "business"
        let expectation = self.expectation(description: "Fetch posts should succeed with actual data")
        viewModel.fetchPosts(category: category)
        viewModel.$articles
            .dropFirst()
            .sink { articles in
                XCTAssertTrue(articles.count > 0, "Expected at least one article to be fetched.")
                XCTAssertNotNil(articles.first?.title, "Expected first article to have a title.")
                XCTAssertNotNil(articles.first?.url, "Expected first article to have a URL.")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFetchPostsFailureRealData() {
        let invalidCategory = "invalidCategory"
        let expectation = self.expectation(description: "Fetch posts should fail with invalid category")
        viewModel.fetchPosts(category: invalidCategory)

        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertNotNil(errorMessage, "Expected error message to be set.")
                XCTAssertTrue(errorMessage?.contains("error") == true, "Expected error message to contain 'error'.")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
