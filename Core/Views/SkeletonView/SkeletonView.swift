//
//  SkeletonView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .shimmering()
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
        .cornerRadius(10)
        .padding(.vertical, 10)
        .transition(.opacity.combined(with: .scale)) // Add smooth transition
    }
}

struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
