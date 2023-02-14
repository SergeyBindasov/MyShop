//
//  MSImageLoader.swift
//  MyShop
//
//  Created by Sergey on 14.02.2023.
//

import Foundation

final class MSImageLoader {
    static let shared = MSImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}

    public func downloadImage(_ url: URL, complition: @escaping(Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
            complition(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self.imageDataCache.setObject(value, forKey: key)
            complition(.success(data))
        }
        task.resume()
    }
}
