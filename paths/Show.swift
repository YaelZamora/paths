//
//  Show.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 02/01/24.
//

import SwiftUI
import LocalAuthentication

struct Show: View {
    @State private var email = ""
    @State private var password = ""
    @State private var path = [Int]()
    @State private var present = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.pink
                ContentView()
                VStack {
                    Spacer()
                    Text("Book Designer").font(.largeTitle).bold()
                    VStack {
                        Spacer()
                        TextField("", text: $email, prompt: Text("Email").foregroundColor(.white))
                            .padding()
                            .underlineTextField()
                        SecureField("", text: $password, prompt: Text("Contraseña").foregroundColor(.white))
                            .padding()
                            .underlineTextField()
                        Button {
                            if !email.isEmpty && !password.isEmpty {
                                path = [1]
                            } else {
                                present.toggle()
                            }
                        } label: {
                            Text("Iniciar sesión")
                                .frame(width: 200, height: 50)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Button {
                            authenticate()
                        } label: {
                            Label("Face ID", systemImage: "faceid").font(.title2)
                        }
                        Spacer()
                        Button("Recuperar contraseña") {
                            
                        }.padding(.bottom)
                    }
                    .frame(width: 300, height: 450)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20).stroke(.white)
                    )
                    .padding(.bottom, 60)
                    Spacer()
                    Button("Acuerdo de privacidad") {
                        //
                    }
                    .foregroundColor(.white)
                    .padding(.bottom)
                }
            }
            .ignoresSafeArea()
            .navigationDestination(for: Int.self) { destination in
                AnotherView()
            }
            .alert("Campos vacíos", isPresented: $present) {
                
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    path = [10]
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    Show()
}
