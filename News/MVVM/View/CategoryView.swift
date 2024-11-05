//
//  CategoryView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 05/11/24.
//

import SwiftUI

import SwiftUI

struct CategoryView: View {
    let category: String
    let isSelected: Bool
    let onSelect: (String) -> Void
    
    var body: some View {
        Text(category.capitalized)
            .font(.headline)
            .fontWeight(.medium)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.red : Color.white)
        
            .foregroundColor(isSelected ? Color.white : Color.primary)
            .cornerRadius(20)
            .shadow(radius: isSelected ? 10 : 3, x: 0, y: 3)
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.5), value: isSelected)
            .onTapGesture {
                onSelect(category)
            }
    }
}
