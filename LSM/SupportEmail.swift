//
//  SupportEmail.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 10/04/23.
//

import SwiftUI
import UIKit

struct SupportEmail {
    let toAddress: String
    let subject: String
    let messageHeader: String
    var body: String {"""
        Hola    
    """
    }
    
    func send(openURL: OpenURLAction) {
        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else { return }
        openURL(url) { accepted in
            if !accepted {
                print("""
                    Este dipositivo no soporta el envío de mail
                        \(body)
                    """
                )
            }
        }
    }
}
