//
//  Utilities.swift
//  News
//
//  Created by Siddharth Adhvaryu on 04/11/24.
//

import Foundation

struct Utilities {
    
    static func formattedDate(from dateString: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else { return "Unknown Date" }
        
        let now = Date()
        let timeInterval = now.timeIntervalSince(date)
        
        if timeInterval < 3600 {
            let minutes = Int(timeInterval / 60)
            return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
        } else if timeInterval < 86400 {
            let hours = Int(timeInterval / 3600)
            return "\(hours) hour\(hours == 1 ? "" : "s") ago"
        } else {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .long
            outputFormatter.timeStyle = .short
            outputFormatter.timeZone = TimeZone.current
            
            return outputFormatter.string(from: date)
        }
    }
}

class TextUtility {
    enum General: String {
        case noData = "No Data"
        case noUrl = "No URL"
        case apptitle = "The News Express"
        case noTitle = "No Title"
        case home = "Home"
        case noDescription = "No Description"
    }
}

class ImageUtility {
    enum SystemImage: String {
        case exclamationMarkTriangle = "exclamationmark.triangle"
        case squareArrayUp = "square.and.arrow.up"
        case checkmarkCircle = "checkmark.circle"
        case heart = "heart"
        case house = "house"
    }
}

enum APIEndpoint {
    case topHeadlines(category: String)

    var url: URL? {
        switch self {
        case .topHeadlines(let category):
            let apiKey = "7e2bbcbb922040858877d478aaa080c2"
            return URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=\(apiKey)")
        }
    }
}
