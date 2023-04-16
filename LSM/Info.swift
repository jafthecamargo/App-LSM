//
//  Info.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 10/04/23.
//

import SwiftUI
import SafariServices
    
struct Info: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var info: Bool
    
    @State private var isShowingSafariView = false

    var body: some View {
        NavigationView {
            VStack {
                Text("La función de reconocimiento de señas permite a los usuarios apuntar la cámara de su dispositivo móvil a una persona que está haciendo señas en LSM y utilizar la tecnología de inteligencia artificial para detectar y reconocer las señas en tiempo real.\n\nEs importante tener en cuenta que pueden haber errores ocasionales en la detección y traducción. Por lo tanto, es importante que los usuarios tengan en cuenta estas limitaciones y que utilicen la aplicación en combinación con su propia comprensión del lenguaje para que la comunicación sea precisa y efectiva.")
                    .padding(.horizontal, 20)
            }
            .navigationTitle("Información")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSafariView = true
                    }) {
                        Image(systemName: "safari.fill")
                            .padding(.vertical)
                    }
                    .fullScreenCover(isPresented: $isShowingSafariView) {
                        SafariView(url: URL(string: "https://www.gob.mx/conadis/articulos/lengua-de-senas-mexicana-lsm?idiom=es")!)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Cerrar")
                        .padding(.vertical)
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            info = false
                        }
                }
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Implementamos el metodo obligatorio para actualizar la vista
    }
}
