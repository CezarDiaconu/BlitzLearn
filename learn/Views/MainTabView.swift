//
//  MainTabView.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab("Learn", systemImage: "book.fill") {
                LearnView()
            }
            Tab("Practice", systemImage: "pencil") {
                PracticeView()
            }
            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
