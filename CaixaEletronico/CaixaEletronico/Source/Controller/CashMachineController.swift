//
//  CaixaEletronicoViewController.swift
//  CaixaEletronico
//
//  Created by Diego William Crozare on 17/07/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit

/// Enum de notas suportadas pelo caixa eletronico.
enum MoneyNotes: Int, CaseIterable {
    case hundred = 100
    case fifty = 50
    case twenty = 20
    case ten = 10
    case zero = 0
    
    var value: Int {
        return self.rawValue
    }
}

/// Enum de tipos de servicos
enum ServiceType {
    case withdrawal(Int)
    case deposit(Int)
    case invalid
}

class CashMachineController {
    
    //MARK: - Constants
    var string = String()
    let result = "Valor do Saque: R$ %d – Resultado Esperado: Entregar %@"
    weak var delegate: CashMachineProtocol?
    
    init() { }
    
    //MARK: - Methods
    
    func cashOperation(_ operation: ServiceType) {
        switch operation {
        case .deposit(let value):
            print("##NOT IMPLEMENTED -- \(value) -- ##")
        case .withdrawal(let value):
            accountWithdrawal(value)
        default:
            print("##NOT IMPLEMENTED##")
        }
    }
    
    /// Operacao de saque com retorno de quantidade de notas
    ///
    /// - Parameter value: valor do saque
    /// - Returns: label com quantidade de notas
    private func accountWithdrawal(_ value: Int) {
        var newValue = value
        var dictionary = [Float: Int]()
        
        let values = MoneyNotes.allCases.map { $0.rawValue }
        
        values.forEach { (value) in
            if newValue >= value && value != 0 {
                let quantityNotes = newValue / value
                dictionary[Float(value)] = quantityNotes
                newValue = newValue - value * quantityNotes
            }
        }
        
        return configString(dictionary, valueInitial: value)
    }
    
    /// configuracao de string de retorno
    ///
    /// - Parameters:
    ///   - dictionary: dicionario com os valores
    ///   - valueInitial: valor de saque
    /// - Returns: retorna string ordenada
    private func configString(_ dictionary: Dictionary<Float, Int>, valueInitial: Int) {
        let sortedByValueDictionary = dictionary.sorted { $0 > $1 }
        
        for (key, value) in sortedByValueDictionary {
            if value != 0 {
                self.string.append(" \(value) nota R$\(key),")
            }
        }
        
        self.string.removeLast()
        delegate?.withdrawal(value: String(format: self.result,
                                           valueInitial,
                                           self.string))
    }
}
