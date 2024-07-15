//
//  HeaderView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("👋")
                    .font(.largeTitle)
                
                Spacer()
                
                Image("profileImage")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
            .padding(.horizontal)
            
            Text("Hello, Muhammad")
                .font(.system(size: 20, weight: .regular))
                .padding(.horizontal)
            
            Text("Explore\nGames Giveaways")
                .font(.system(size: 28, weight: .bold))
                .lineLimit(2)
                .padding(.horizontal)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
