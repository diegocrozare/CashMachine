//
//  CashMachineView.swift
//  CaixaEletronico
//
//  Created by Diego William Crozare on 17/07/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit

class CashMachineView: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var notesDescription: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var buttonCash: UIButton!
    @IBOutlet weak var viewTextField: UIView!
    
    let controller = CashMachineController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        notesDescription.isHidden = true
        buttonCash.setupCornerRadius(radius: 10)
        viewTextField.setupCornerRadius(radius: 10)
    }
    
    //MARK: - Actions
    @IBAction func buttonWithdrawal(_ sender: Any) {
        if let valorWithdrawal = Int(valueTextField.text ?? "0") {
           controller.delegate = self
           controller.cashOperation(.withdrawal(valorWithdrawal))
        }
    }
}

//MARK: - Extension
extension CashMachineView: CashMachineProtocol {
    func withdrawal(value: String) {
        notesDescription.isHidden = false
        notesDescription.text = value
        valueTextField.text = String()
    }
}
