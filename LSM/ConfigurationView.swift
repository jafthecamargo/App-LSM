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
    @Binding var config: Bool
    
    @State private var donar = false
    @State private var email = SupportEmail(toAddress: "jethro_ocelotl2001@hotmail.com", subject: "Comentario", messageHeader: "")
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
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
                    Section(header: Text("ACERCA DE"), footer: Text("© 2023 LSM Todos los derechos reservados")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)) {
                        HStack {
                            Link("Configuración del sistema", destination: URL(string: UIApplication.openSettingsURLString)!)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Spacer()
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.accentColor)
                        }
                        Button(action: {
                            email.send(openURL: openURL)
                        }) {
                            HStack {
                                Text("Comentarios")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                Image(systemName: "quote.bubble.fill")
                            }
                        }
                        HStack {
                            Link("Califícanos en la App Store", destination: URL(string: "itms-apps://itunes.apple.com/app/id1570543920?action=write-review")!)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Spacer()
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.accentColor)
                            }
                        NavigationLink(destination: Creditos().navigationBarTitleDisplayMode(.inline)) {
                            HStack {
                                Text("Créditos")
                            }
                        }
                        HStack {
                            Link("Contribuye con la traducción", destination: URL(string: "https://aged-court-904.notion.site/LSM-420d2a90603d4839962cdb37e3e34bf0")!)
                        }
                    }
                }
                .alert(isPresented: $donar) {
                    Alert(title: Text("Donar"), message: Text("¿Estás seguro de que deseas realizar una donación?"), primaryButton: .destructive(Text("Sí"), action: {
                        // Realizar la acción de la donación
                    }), secondaryButton: .cancel(Text("No")))
                }
            }
            .navigationTitle("Configuración")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Text("Cerrar")
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            config = false
                        }
                }
            }
        }
    }
}
