//
//  ConfigurationView.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 07/04/23.
//

import SwiftUI

struct ConfigurationView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var config: Bool
  
    @State private var donar = false
    @State private var email = SupportEmail(toAddress: "jethro_ocelotl2001@hotmail.com", subject: "Comentario", messageHeader: "")
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("GENERAL") {
                        HStack {
                            Link("Configuración del sistema", destination: URL(string: UIApplication.openSettingsURLString)!)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Spacer()
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.accentColor)
                        }
                    }
                    
                    Section(header: Text("APOYOS"), footer: Text("Si te gusta nuestro proyecto, puedes ayudarnos a financiar el desarrollo")) {
                        Button(action: {
                            donar = true
                        }) {
                            HStack {
                                Text("Donar")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                Image(systemName: "heart.fill")
                            }
                        }
                    }
                    
                    Section(header: Text("INFORMACIÓN"), footer: Text("Versión Alpha - v0.1a")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)) {
                            HStack {
                                Link("Califica a LSM", destination: URL(string: "itms-apps://itunes.apple.com/app/id1570543920?action=write-review")!)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            
                            HStack {
                                Link("Contribuye con la traducción", destination: URL(string: "https://aged-court-904.notion.site/LSM-420d2a90603d4839962cdb37e3e34bf0")!)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                Image(systemName: "quote.closing")
                                    .foregroundColor(Color.accentColor)
                            }
                            
                            Button(action: {
                                email.send(openURL: openURL)
                            }) {
                                HStack {
                                    Text("Comentarios")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                    Spacer()
                                    Text("info@lsm.com")
                                }
                            }
                            
                            NavigationLink(destination: AcercaDe()) {
                                Text("Acerca de")
                            }
                        }
                }
                .alert(isPresented: $donar) {
                    Alert(title: Text("Donar"), message: Text("¿Estás seguro de que deseas realizar una donación?"), primaryButton: .destructive(Text("No")), secondaryButton: .default(Text("Si"), action: {
                            print("Donar")
                        })
                    )
                }
            }
            .navigationTitle("Ajustes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Cerrar")
                        .padding(.vertical)
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
        }
    }
}
