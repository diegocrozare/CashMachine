//
//  CaixaProtocol.swift
//  CaixaEletronico
//
//  Created by Diego William Crozare on 17/07/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import Foundation

/// Protocolo de caixa eletronico
protocol CashMachineProtocol: AnyObject {
    func withdrawal(value: String)
}
