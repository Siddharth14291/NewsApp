//
//  NoDataView.swift
//  News
//
//  Created by Siddharth Adhvaryu on 05/11/24.
//

import SwiftUI

struct NoDataView: View {
    var errorMsg: String?
    
    var body: some View {
        VStack {
            Image(systemName: ImageUtility.SystemImage.exclamationMarkTriangle.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)

            Text(errorMsg ?? TextUtility.General.noData.rawValue)
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
