//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jayden Kong on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .orange]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Prominent title")
                    .prominentTitle()
                    .multilineTextAlignment(.center)
                    .padding()

                Text("Agree")
                    .modifier(CapsuleView(color: .cyan))

                // Custom .customCapsule() view modifier
                Text("Delete")
                    .customCapsule(color: .red)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 80)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 10)
            .padding(.horizontal)
        }
    }
}

struct CapsuleView: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(Capsule())
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func customCapsule(color: Color) -> some View {
        modifier(CapsuleView(color: color))
    }

    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
