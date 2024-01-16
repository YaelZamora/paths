//
//  DatosView.swift
//  paths
//
//  Created by Yael Javier Zamora Moreno on 14/01/24.
//

import SwiftUI

struct DatosView: View {
    
    @State var informacion = Informacion(from: <#Decoder#>)
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nombre", text: $informacion.nombre)
                    TextField("Edad", value: $informacion.edad, format: .number)
                    TextField("Puesto", text: $informacion.puesto)
                }
                
                Section {
                    HStack {
                        Text("Nombre:")
                        Text(informacion.nombre)
                    }
                    
                    HStack {
                        Text("Edad:")
                        Text((informacion.edad == 0) ? "" : "\(informacion.edad)")
                    }
                    
                    HStack {
                        Text("Puesto:")
                        Text(informacion.puesto)
                    }
                    
                    NavigationLink {
                        ShowData(showData: informacion)
                    } label: {
                        Text("Mostrar los datos")
                    }
                }
            }
            .navigationTitle("Información")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DatosView()
}
