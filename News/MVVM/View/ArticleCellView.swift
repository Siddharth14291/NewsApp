//
//  ArticleCellView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 02/11/24.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    let appName = "News Express"
    
    var body: some View {
        HStack {
            if let urlString = article.urlToImage, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                .frame(width: 100)
            } else {
                ZStack {
                    Color.red
                        .cornerRadius(5)
                        .frame(width: 100, height: 100)
                    
                    Text(getAppInitials())
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                }
            }

            VStack(alignment: .leading) {
                Text(article.title ?? TextUtility.General.noTitle.rawValue)
                    .font(.headline)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
            .padding(.leading, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 2)
        .frame(height: 100)
        .contentShape(Rectangle())
    }

    private func getAppInitials() -> String {
        let initials = appName.split(separator: " ").compactMap { $0.first }
        return initials.prefix(2).map { String($0) }.joined().uppercased()
    }
}
