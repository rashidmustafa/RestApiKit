//
//  APIRequest.swift
//  RestApiKit
//
//  Created by Rashid Mustafa on 30/08/2022.
//

import Foundation


protocol Request {
    var url: URL { get set }
    var method: HTTPMethod { get set }
}

public struct APIRequest : Request {
    var url: URL
    var method: HTTPMethod
    var requestBody: Data? = nil

    public init(withUrl url: URL, forHttpMethod method: HTTPMethod, requestBody: Data? = nil) {
        self.url = url
        self.method = method
        self.requestBody = requestBody != nil ? requestBody : nil
    }
}
