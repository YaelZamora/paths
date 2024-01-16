//
//  Extensions.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 02/01/24.
//

import SwiftUI
import Foundation

extension Color{
    init(hex: UInt, alpha: Double = 1){
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha

        )
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color(hex: 0xffCCCCFF))
            .padding(10)
    }
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Primer Error")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Segundo Error")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Falló el decode del archivo \(file)")
        }
        
        return loaded
    }
}
