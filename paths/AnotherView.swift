//
//  AnotherView.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 02/01/24.
//

import SwiftUI

struct AnotherView: View {
    @State private var varX = CGFloat()
    @State private var circlePosition = CGPoint(x: 55, y: 55)
    @State private var color = Color(red: 255, green: 0, blue: 0)
    
    @State private var colorRed: Double = 255
    @State private var colorGreen: Double = 90
    @State private var colorBlue: Double = 90
    
    @State private var texto = "Reservar"
    @State private var cambiado = false
    
    var body: some View {
        VStack {
            Text("Hola").navigationBarBackButtonHidden()
            
            ZStack {
                Text(texto).font(.title).bold().padding(.leading, (cambiado) ? -60 : 60)
                Circle()
                    .frame(width: 100, height: 100)
                    .position(circlePosition)
                    .overlay(
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .position(circlePosition)
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.location.x < 55 {
                                    self.varX = 55
                                    texto = "Reservar"
                                    cambiado.toggle()
                                } else if gesture.location.x > 230 {
                                    self.varX = 245
                                    texto = "Reservado"
                                    cambiado.toggle()
                                } else {
                                    self.varX = gesture.location.x
                                }
                                self.circlePosition = CGPoint(x: varX, y: 55)
                                self.color = Color(red: colorRed, green: colorGreen, blue: colorBlue)
                            }
                    )
            }
            .frame(width: 300, height: 110)
            .background(cambiado ? .green : .orange)
            .cornerRadius(60)
            .animation(Animation.easeInOut, value: cambiado)
        }
    }
}

#Preview {
    AnotherView()
}
