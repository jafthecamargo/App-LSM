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
                Section("ALUMNOS") {
                    HStack {
                        Text("Jafthe Camargo")
                        Spacer()
                        Text("Programador")
                            .foregroundColor(Color.accentColor)
                    }
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
                Section(header: Text("NOS AYUDAN A TRADUCIR"), footer: Text("Versión Alpha - v0.1a")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)){
                    Text("")
                    Text("")
                    Text("")
                }
            }
        }
    }
}

struct Creditos_Previews: PreviewProvider {
    static var previews: some View {
        Creditos()
    }
}
