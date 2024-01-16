//
//  ShowData.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 14/01/24.
//

import SwiftUI

struct ShowData: View {
    var showData: Informacion
    
    var body: some View {
        VStack {
            Text(showData.nombre)
            Text("\(showData.edad)")
            Text(showData.puesto)
        }
    }
}

#Preview {
    ShowData(showData: Informacion())
}
