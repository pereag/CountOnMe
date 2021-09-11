//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private var calculator = Calculator()

    @IBOutlet private weak var textView: UITextView!

    @IBOutlet private var numberButtons: [UIButton]!

    // MARK: - View Life cycles

    override func viewDidLoad() {
        textView.isEditable = false
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        calculator.displayedText = { [weak self] text in
            self?.textView.text = text
        }

        calculator.displayedAlert = { [weak self] alertContent in
            self?.presentAlert(content: alertContent)
        }
    }

    private func presentAlert(content: AlertContent) {
        let alertVC = UIAlertController( title: content.title, message: content.message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: content.cancelTitle, style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    // MARK: - View actions

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.didTap(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculator.addAnAdditionSymboleToElements()
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculator.addAnSubstractionSymboleToElements()
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        calculator.addAnMultiplicationSymboleToElements()
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        calculator.addAnDivisionSymboleToElements()
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.processCalcul()
    }
}
