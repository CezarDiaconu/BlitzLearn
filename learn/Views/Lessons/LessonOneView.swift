//
//  LessonOneView.swift
//  learn
//
//  Created by Cezar Diaconu on 11.06.2026.
//

import SwiftUI

struct LessonOneView: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("Lesson One - Family Members")
                    .font(.largeTitle)
                    .fontWeight(.bold) 
                    .padding(.bottom, 20)
                Text("(die) Mutter = mother")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Vater = father")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Bruder = brother")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Schwester = sister")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Sohn = son")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Tochter = daughter")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Spacer()
                Text("(die) Großmutter = grandmother")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Großvater = grandfather")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Neffe = grandson")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Nichte = granddaughter")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Spacer()
                Text("(der) Onkel = uncle")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Tante = aunt")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(der) Enkel = (uncle's) grandson")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Enkelin = (uncle's) granddaughter")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Spacer()
                Text("(die) Eltern = parents")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Großeltern = grandparents")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Kinder = children")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                Text("(die) Geschwister = siblings")
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                
                
            }
        }
    }
}

#Preview {
    LessonOneView()
}
