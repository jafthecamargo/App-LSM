//
//  Info.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 10/04/23.
//

import SwiftUI
    
struct Info: View {
    
    @Binding var info: Bool
    @State private var showWebView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("El Lenguaje de Señas Mexicano (LSM) es un sistema de comunicación visual y gestual utilizado por las personas sordas y las que tienen dificultades para comunicarse oralmente en México. El LSM utiliza movimientos de las manos, gestos faciales y corporales para expresar conceptos, palabras y frases.\n\nEl LSM es una lengua natural, con su propia gramática y estructura, y no es simplemente una representación visual del español hablado. Tiene su propio vocabulario y sintaxis, y varía en su uso dependiendo de la región de México en la que se utilice.")
                .padding(.horizontal, 20)
                .multilineTextAlignment(.leading)
            }
            .navigationTitle("Información")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Link(destination: URL(string: "https://www.gob.mx/conadis/articulos/lengua-de-senas-mexicana-lsm?idiom=es")!, label: {
                        Image(systemName: "hand.raised.fingers.spread.fill")
                    })
                    Text("Cerrar")
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            info = false
                        }
                }
            }
        }
    }
}
