//
//  OtherViewController.swift
//  PassData
//
//  Created by Cristina Mihaela on 22.03.2022.
//

import UIKit

class OtherViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    var completionHandler: ((String?) -> Void)?

    @IBAction func didTapDoneButton(_ sender: UIButton) {
        completionHandler?(textField.text)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.returnKeyType = .done
        textField.delegate = self
    }
}



extension OtherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            print(text)
        }
        return true
    }
}
