//
//  ContentView.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 300))
            path.addQuadCurve(to: CGPoint(x: 80, y: 230), control: CGPoint(x: 10, y: 250))
            path.addLine(to: CGPoint(x: 350, y: 230))
            path.addQuadCurve(to: CGPoint(x: 400, y: 130), control: CGPoint(x: 390, y: 230))
            path.addLine(to: CGPoint(x: 400, y: 0))
        }.fill(.blue)
    }
}

#Preview {
    ContentView()
}
