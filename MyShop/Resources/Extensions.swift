//
//  Extensions.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach ({
            addSubview($0)
        })
    }
    
    func applyLayer() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 12
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.30
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}

extension UIImage {

static func getImagesByNames(names: [String]) -> [UIImage] {
    return names.compactMap { Self(named: $0) }
}
    
//    static func getImages(forURLs urls: [String], completion: @escaping ([UIImage?]) -> Void) {
//        let group = DispatchGroup()
//        var images: [UIImage?] = .init(repeating: nil, count: urls.count)
//        
//        for (index, urlString) in urls.enumerated() {
//            group.enter()
//            DispatchQueue.global().async {
//                var image: UIImage?
//                if let url = URL(string: urlString) {
//                    if let data = try? Data(contentsOf: url) {
//                        image = UIImage(data: data)
//                    }
//                }
//                images[index] = image
//                group.leave()
//            }
//        }
//        
//        group.notify(queue: .main) {
//            completion(images)
//        }
//    }
}

extension String {
    static func getInitialPrice(with base: Int, with percent: Double) -> String {
        //A2 = A1 + A1 * P / 100
        let price = base + base * Int(percent) / 100
        return String(price)
    }
}


