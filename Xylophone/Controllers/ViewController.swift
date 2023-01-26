//
//  ViewController.swift
//  Xylophone
//
//  Created by Алексей on 26.01.2023.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {

    //MARK: - let\var
    var player: AVAudioPlayer?

    //MARK: - IBOutlet
    @IBOutlet weak var stackButton: UIStackView!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }

    //MARK: - IBAction
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let nameSound = sender.titleLabel?.text else { return }
        winking(sender)
        playSound(witn: nameSound)
    }
}

private extension ViewController {

    //MARK: - flow funcs
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

    func playSound(witn name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    func winking(_ view: UIView) {
        UIView.animate(withDuration: 0.2) {
            view.layer.opacity = 0.5
        } completion: { _ in
            view.layer.opacity = 1
        }
    }
}
