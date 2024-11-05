//
//  DetailPage.swift
//  News
//
//  Created by Siddharth Adhvaryu on 02/11/24.
//

import SwiftUI

struct DetailPage: View {
    let article: Article
    let appName = "News Express"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let urlString = article.urlToImage, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 250)
                    }
                } else {
                    ZStack {
                        Color.red
                            .frame(height: 250)

                        Text(getAppInitials())
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 250, alignment: .center)
                    }
                }
                
                if let publishedAt = article.publishedAt {
                    Text("\(Utilities.formattedDate(from: publishedAt))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                
                Text(article.title ?? TextUtility.General.noTitle.rawValue)
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.top, 8)

                Text(article.descriptionField ?? TextUtility.General.noDescription.rawValue)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 8)

                Spacer()

                HStack {
                    Spacer()
                    ShareLink(item: article.url ?? TextUtility.General.noUrl.rawValue,
                               message: Text("\(article.title ?? TextUtility.General.noTitle.rawValue)")) {
                        Label("", systemImage: ImageUtility.SystemImage.squareArrayUp.rawValue)
                            .foregroundColor(.gray)
                            .frame(width: 60, height: 40)
                            .cornerRadius(8)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationTitle(article.source?.name ?? "")
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func getAppInitials() -> String {
        let initials = appName.split(separator: " ").compactMap { $0.first }
        return initials.prefix(2).map { String($0) }.joined().uppercased()
    }
}
