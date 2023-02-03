//
//  MSService.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

final class MSService {
    
    static let shared = MSService()
    
    private init() {}
    
    enum MSServiceError: Error {
            case failedToCreateRequest
            case failedToGetData
        }
    
    public func execute<T: Codable>(_ request: MSRequest,
                                        expecting type: T.Type,
                                        complition: @escaping (Result<T,Error>)
                                        -> Void) {
            guard let urlRequest = self.request(from: request) else  {
                complition(.failure(MSServiceError.failedToCreateRequest))
                return
            }
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else  {
                    complition(.failure(error ?? MSServiceError.failedToGetData))
                    return
                }
                //Decode response
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    complition(.success(result))
                    
                }
                catch {
                    complition(.failure(error))
                }
            }
            task.resume()
        }
    
    public func makeCategoryRequest(with request: MSRequest, complition: @escaping (Result<[String],Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else  {
        complition(.failure(MSServiceError.failedToCreateRequest))
        return
    }
    let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
        guard let data = data, error == nil else  {
            complition(.failure(error ?? MSServiceError.failedToGetData))
            return
        }
        //Decode response
        do {
            let result = try JSONDecoder().decode([String].self, from: data)
            complition(.success(result))
            
        }
        catch {
            complition(.failure(error))
        }
    }
    task.resume()
        
    }
    
    private func request(from msRequest: MSRequest) -> URLRequest? {
         guard let url = msRequest.url else { return nil}
         var request = URLRequest(url: url)
        request.httpMethod = msRequest.httpMethod
         return request
     }
}


