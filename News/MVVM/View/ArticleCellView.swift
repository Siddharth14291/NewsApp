//
//  ArticleCellView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 02/11/24.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    
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
                    
                    Text(Utilities.getAppInitials())
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                }
                .shadow(radius: 5)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? TextUtility.General.noTitle.rawValue)
                    .font(.headline)
                    .lineLimit(3)
                    .truncationMode(.tail)
                
                if let publishedAt = article.publishedAt {
                    Text("\(Utilities.formattedDate(from: publishedAt))")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                }
            }
            .padding(.leading, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 2)
        .frame(height: 100)
        .contentShape(Rectangle())
    }
}
