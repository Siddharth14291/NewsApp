//
//  DetailPage.swift
//  News
//
//  Created by Siddharth Adhvaryu on 02/11/24.
//

import SwiftUI

struct DetailPage: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let urlString = article.urlToImage, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .frame(height: 250)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                } else {
                    ZStack {
                        Color.red
                            .cornerRadius(10)
                            .frame(height: 250)

                        Text(Utilities.getAppInitials())
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 250, alignment: .center)
                    }
                }
                
                if let publishedAt = article.publishedAt {
                    Text(Utilities.formattedDate(from: publishedAt))
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                }
                
                Text(article.title ?? TextUtility.General.noTitle.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .padding(.top, 8)
                
                Text(article.descriptionField ?? TextUtility.General.noDescription.rawValue)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(5)
                    .padding(.top, 2)

                HStack {
                    Spacer()
                    ShareLink(item: article.url ?? TextUtility.General.noUrl.rawValue,
                               message: Text("\(article.title ?? TextUtility.General.noTitle.rawValue)")) {
                        Label(TextUtility.General.share.rawValue, systemImage: ImageUtility.SystemImage.squareArrayUp.rawValue)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .frame(width: 160, height: 50)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding([.horizontal, .top])
        }
        .navigationTitle(article.source?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}
