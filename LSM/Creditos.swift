//
//  Creditos.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 09/04/23.
//

import SwiftUI

struct Creditos: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
        .navigationTitle("Créditos")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color.gray)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
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
