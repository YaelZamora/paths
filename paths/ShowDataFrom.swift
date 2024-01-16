//
//  ShowDataFrom.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 14/01/24.
//

import SwiftUI

struct ShowDataFrom: View {
    let datos: [String: Informacion] = Bundle.main.decode("datos.json")
    
    var body: some View {
        Text(String(datos.count))
    }
}

#Preview {
    ShowDataFrom()
}
