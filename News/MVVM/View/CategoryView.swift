//
//  CategoryView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 05/11/24.
//

import SwiftUI

struct CategoryView: View {
    let category: String
    let isSelected: Bool
    let onSelect: (String) -> Void

    var body: some View {
        Text(category.capitalized)
            .font(.subheadline)
            .padding()
            .background(isSelected ? Color.red : Color.white)
            .cornerRadius(8)
            .foregroundColor(isSelected ? Color.white : Color.black)
            .shadow(radius: 1)
            .onTapGesture {
                onSelect(category)
            }
    }
}
