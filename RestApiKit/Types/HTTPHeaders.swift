//
//  HTTPHeaders.swift
//  RestApiKit
//
//  Created by Rashid Mustafa on 30/08/2022.
//

import Foundation

typealias Headers = [String:String]

public enum HTTPMethod : String
{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
