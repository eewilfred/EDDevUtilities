//
//  NetworkManager.swift
//  ahoyWeather
//
//  Created by Edwin Wilson on 26/01/2021.
//  Copyright © 2021 Edwin Wilson. All rights reserved.
//

import Foundation

public struct Response<Value> {

    /// The URL request sent to the server
    public let requestURL: URL?

    /// The data returned by the server
    public let data: Data?

    /// Decoded Result
    public let result: Value?

    /// Error received
    public let error: Error?
}

public protocol BaseResult: Decodable {}


open class NetworkManager {

    static let shared = NetworkManager()
    let session  = URLSession.shared

    func start<T: BaseResult>(request: URL, complition: ((Response<T>) -> Void)?) {

        let dataTask = session.dataTask(
        with: request) { ( data, response, error) in

            if error != nil {
                print(error!.localizedDescription)
            }

            guard let data = data else { return }

            if let model = try? JSONDecoder().decode(T.self, from: data) {
                let result = Response(
                    requestURL: request,
                    data: data,
                    result: model,
                    error: error
                )

                complition?(result)
            }
        }

        dataTask.resume()
    }
}
