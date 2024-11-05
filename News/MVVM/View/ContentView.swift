//
//  ContentView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 01/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: ImageUtility.SystemImage.house.rawValue)
                    Text(TextUtility.General.home.rawValue)
                }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
      }
}

#Preview {
    ContentView()
}
