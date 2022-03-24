//
//  ViewController.swift
//  PassData
//
//  Created by Cristina Mihaela on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //@IBOutlet weak var button: UIButton!

    @IBOutlet weak var textLabelHello: UILabel!

    @IBAction func didTapButtonOtherScreen(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "otherScreen") as! OtherViewController
        vc.modalPresentationStyle = .fullScreen
        vc.completionHandler = { text in
            var helloString = "Hello, "
            helloString += text ?? ""
            self.textLabelHello.text = helloString
        }
        present(vc, animated: true)
    }


}

