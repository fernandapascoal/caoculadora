//
//  porte.swift
//  caoculadora
//
//  Created by Fernanda Pascoal on 10/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case médio = "Médio"
    case grande = "Grande"
    
    func conversaoDeIdade(anos: Int, meses: Int) -> Int {
        
        let result: Int
        let multiplicador: Int
        switch self {
        case .pequeno:
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        // anos * multiplicador
        result = anos * multiplicador + meses * multiplicador / 12
        
        return result
    }
}
