//
//  ImageProvider.swift
//  CacheApplication
//
//  Created by Данил Чапаров on 20.03.2022.
//

import UIKit

final class ImageProvider {
    
    static let shared = ImageProvider()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    public func fetchImage(completion: @escaping (UIImage?) -> Void) {
        
        if let image = cache.object(forKey: Constants.imageName) {
            print("Fetch from cache")
            completion(image)
            return
        }
        
        guard let url = URL(string: Constants.imageURL) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                
                self?.cache.setObject(image, forKey: Constants.imageName)
                print("Fetch from network")
                completion(image)
            }
        }
        task.resume()
    }
}
