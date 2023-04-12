//
//  Creditos.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 09/04/23.
//

import SwiftUI

struct Creditos: View {
    
    var body: some View {
        
        VStack {
            Form {
                Section("DIRECTORES") {
                    HStack {
                        Text("")
                        Spacer()
                        Text("")
                            .foregroundColor(Color.accentColor)
                    }
                    HStack {
                        Text("")
                        Spacer()
                        Text("")
                            .foregroundColor(Color.accentColor)
                    }
                }
                Section("ALUMNO") {
                    HStack {
                        Text("Jafthe Camargo")
                        Spacer()
                        Text("Programador")
                            .foregroundColor(Color.accentColor)
                    }
                    Text("")
                    Text("")
                }
                Section("NOS AYUDAN A TRADUCIR") {
                    Text("")
                    Text("")
                    Text("")
                }
            }
        }
    }
}
