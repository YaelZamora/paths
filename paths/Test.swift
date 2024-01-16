//
//  Test.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 14/01/24.
//

import Foundation

struct Informacion: Codable, Identifiable {
    var id: Int
    var nombre: String = ""
    var edad: Int = 0
    var puesto: String = ""
}
