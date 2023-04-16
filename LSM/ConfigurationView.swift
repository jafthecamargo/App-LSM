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
    @State private var email = SupportEmail(toAddress: "lsm@gmail.com", subject: "Comentario", messageHeader: "")
    
    var body: some View {
        NavigationView {
            List {
                Section("GENERAL") {
                    
                    HStack(spacing: 20) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 48, height: 48)
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.accentColor)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Link("Configuración del sistema", destination: URL(string: UIApplication.openSettingsURLString)!)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("Accede a la configuración de tu dispositivo para personalizar la experiencia con la app")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .padding(.vertical, 1)
                
                Section("APOYOS") {
                    
                    HStack(spacing: 20) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 48, height: 48)
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.accentColor)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Donar")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("Si te gusta nuestro proyecto, puedes ayudarnos a financiar el desarrollo")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .onTapGesture {
                        donar = true
                    }
                }
                .padding(.vertical, 1)
                
                Section(header: Text("INFORMACIÓN"), footer: Text("Versión Alpha - v0.1a")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)) {
                        
                    HStack(spacing: 20) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 48, height: 48)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.accentColor)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Link("Califica a LSM", destination: URL(string: "itms-apps://itunes.apple.com/app/id1570543920?action=write-review")!)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("Comparte tu opinión sobre la app y ayúdanos a mejorar")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                      
                    HStack(spacing: 20) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 48, height: 48)
                            Image(systemName: "quote.closing")
                                .foregroundColor(Color.accentColor)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Link(destination: URL(string: "https://aged-court-904.notion.site/LSM-420d2a90603d4839962cdb37e3e34bf0")!, label: {
                                Text("Contribuye con la traducción")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            })
                            Text("Ayúdanos a mejorar nuestra traducción")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                    HStack(spacing: 20) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 48, height: 48)
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color.accentColor)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Comentarios")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("Envíanos tus ideas, solicitudes de función o informa sobre errores que encuentres")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .onTapGesture {
                        email.send(openURL: openURL)
                    }
                    
                    NavigationLink(destination: AcercaDe(config: $config)) {
                        HStack(spacing: 20) {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .cornerRadius(10)
                                    .frame(width: 48, height: 48)
                                Image(systemName: "info.circle.fill")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.accentColor)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Acerca de")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Más información sobre LSM")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
                .padding(.vertical, 1)
            }
            .navigationTitle("Configuración")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Cerrar")
                        .padding(.vertical)
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            config = false
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
    }
}
