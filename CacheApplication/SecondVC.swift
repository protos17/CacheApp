//
//  SecondVC.swift
//  CacheApplication
//
//  Created by Данил Чапаров on 20.03.2022.
//

import UIKit

class SecondVC: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        fetchImage()
    }
    
    private func setView() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func fetchImage() {
        ImageProvider.shared.fetchImage { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
    }
}
