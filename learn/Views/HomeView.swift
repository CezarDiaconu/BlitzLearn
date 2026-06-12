//
//  HomeViewModel.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text("Welcome to BlitzLearn")
                        .padding(20)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .padding(.top, 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                }
            }
            
        
        }.navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
