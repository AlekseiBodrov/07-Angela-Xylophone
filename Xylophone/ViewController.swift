//
//  ViewController.swift
//  Xylophone
//
//  Created by Алексей on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var stackButton: UIStackView!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }


    @IBAction func keyPressed(_ sender: UIButton) {

    }
}

private extension ViewController {
    func setConstraints(){
        var padding: CGFloat = 10
        [
            cButton,
            dButton,
            eButton,
            fButton,
            gButton,
            aButton,
            bButton
        ].forEach({ button in
            guard let button = button else { return }
            button.translatesAutoresizingMaskIntoConstraints = false
            button.leadingAnchor.constraint(equalTo: stackButton.leadingAnchor, constant: padding).isActive = true
            button.trailingAnchor.constraint(equalTo: stackButton.trailingAnchor, constant: -padding).isActive = true
            padding += 5
        })

    }
}
