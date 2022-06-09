//
//  ViewController.swift
//  ActivityViewController
//
//  Created by Vsevolod Migdisov on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("UIActivityViewController", for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
    }

    @objc func buttonTap() {
        guard let url = URL(string: "https://www.apple.com") else { return }
        let ac = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(ac, animated: true)
    }
}

