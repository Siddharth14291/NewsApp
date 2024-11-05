//
//  DashboardView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 03/11/24.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel = PostsViewModel()
    @State private var selectedCategory: String = DashboardView.arrayCategory[0]
    @State private var hasLoaded: Bool = false
    static var arrayCategory = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if !hasLoaded {
                        Spacer()
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(Self.arrayCategory, id: \.self) { category in
                                    CategoryView(category: category, isSelected: selectedCategory == category) { selectedCategory in
                                        self.selectedCategory = selectedCategory
                                        viewModel.fetchPosts(category: selectedCategory)
                                    }
                                }
                            }
                            .padding()
                        }
                    }

                    if viewModel.articles.isEmpty {
                        NoDataView(errorMsg: viewModel.errorMessage)
                    } else {
                        List(viewModel.articles.filter { $0.author != nil }) { article in
                            NavigationLink(destination: DetailPage(article: article)) {
                                ArticleCellView(article: article)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(TextUtility.General.apptitle.rawValue)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                }
            .onAppear {
                if !hasLoaded {
                    viewModel.fetchPosts(category: selectedCategory)
                    hasLoaded = true
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
