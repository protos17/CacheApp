//
//  ViewController.swift
//  CacheApplication
//
//  Created by Данил Чапаров on 20.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }

    private func addButton() {
        let button = UIButton()
        button.setTitle("Tap to show image", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func didTapButton() {
        let vc = SecondVC()
        present(vc, animated: true)
    }
    
}

