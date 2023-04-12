//
//  Info.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 10/04/23.
//

import SwiftUI
import UIKit
    
struct Info: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var info: Bool
    @State private var showWebView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("La aplicación detecta automáticamente las señas que una persona realiza en LSM a través de la cámara del celular. \n\nDespués, la aplicación traduce esas señas a texto en tiempo real, permitiendo al usuario leer y comprender el mensaje en su pantalla. No es necesario que el usuario realice ninguna acción adicional para detectar o traducir las señas.\n\nEs importante tener en cuenta que pueden haber errores ocasionales en la detección y traducción. Por lo tanto, es importante que los usuarios tengan en cuenta estas limitaciones y que utilicen la aplicación en combinación con su propia comprensión del lenguaje para que la comunicación sea precisa y efectiva.La función de reconocimiento de señas permite a los usuarios apuntar la cámara de su dispositivo móvil a una persona que está haciendo señas en LSM y utilizar la tecnología de inteligencia artificial para detectar y reconocer las señas en tiempo real.")
                    .padding(.horizontal, 20)
            }
            .navigationTitle("Información")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Link(destination: URL(string: "https://www.gob.mx/conadis/articulos/lengua-de-senas-mexicana-lsm?idiom=es")!, label: {
                        Text("gob.mx")
                            .padding(.vertical)
                    })
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .fontWeight(.medium)
                        .padding(.vertical)
                        .onTapGesture {
                            info = false
                        }
                }
            }
        }
    }
}
