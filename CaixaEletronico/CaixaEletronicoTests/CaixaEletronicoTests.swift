//
//  CaixaEletronicoTests.swift
//  CaixaEletronicoTests
//
//  Created by Diego William Crozare on 17/07/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import XCTest
@testable import CaixaEletronico

class CaixaEletronicoTests: XCTestCase {
    
    let controller = CashMachineController()
    var valueResult: String?
    
    override func setUp() {
        super.setUp()
        
        controller.delegate = self
    }
    
    func testVerifyReturnFunction() {
        controller.cashOperation(.withdrawal(100))
        XCTAssertNotNil(valueResult)
    }
    
    func testVerifyValueFunction() {
        controller.cashOperation(.withdrawal(250))
        XCTAssertEqual(valueResult, "Valor do Saque: R$ 250 – Resultado Esperado: Entregar  2 nota R$100.0, 1 nota R$50.0")
    }
    
}

extension CaixaEletronicoTests: CashMachineProtocol {
    func withdrawal(value: String) {
        valueResult = value
    }
}
