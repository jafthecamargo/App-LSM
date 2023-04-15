//
//  AcercaDe.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 13/04/23.
//

import SwiftUI

struct AcercaDe: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var config: Bool
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Image("LSM")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(30)
                    Text("LSM")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, -10)
                    Text("Versión Alpha - v0.1a")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .padding(.top, -15)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color.clear)
                .listRowSeparator(Visibility.hidden)
                
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
                .padding(.top, -10)
                
                Section("ALUMNO") {
                    HStack {
                        Text("Jafthe Camargo")
                        Spacer()
                        Text("Programador")
                            .foregroundColor(Color.accentColor)
                    }
                }
                Section("NOS AYUDAN A TRADUCIR") {
                    Text("")
                    Text("")
                    Text("")
                }
            }
        }
        .navigationTitle("Acerca de")
        .navigationBarTitleDisplayMode(.inline)
    }
}
