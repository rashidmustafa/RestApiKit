//
//  ApiClient.swift
//  RestApiKit
//
//  Created by Rashid Mustafa on 30/08/2022.
//

import Foundation

public class ApiClient
{
    public static let shared = ApiClient()
    public var authenticationToken : String? = nil
    public var customJsonDecoder : JSONDecoder? = nil

    private init(){}
    
    private func getSession() -> URLSession {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load Configuration into Session
        return session
    }
    
    public func request<T:Decodable>(request: APIRequest, resultType: T.Type, completionHandler:@escaping(Result<T?, APIError>)-> Void)
    {
        switch request.method
        {
        case .get:
            getData(requestUrl: request.url, resultType: resultType) { completionHandler($0)}
            break

        case .post:
            postData(request: request, resultType: resultType) { completionHandler($0)}
            break

        case .put:
            putData(requestUrl: request.url, resultType: resultType) { completionHandler($0)}
            break

        case .delete:
            deleteData(requestUrl: request.url, resultType: resultType) { completionHandler($0)}
            break
        }
    }

    // MARK: - Private functions
    private func createJsonDecoder() -> JSONDecoder
    {
        let decoder =  customJsonDecoder != nil ? customJsonDecoder! : JSONDecoder()
        if(customJsonDecoder == nil) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    
    private func createUrlRequest(requestUrl: URL) -> URLRequest
    {
        var urlRequest = URLRequest(url: requestUrl)
        if(authenticationToken != nil) {
            urlRequest.setValue(authenticationToken!, forHTTPHeaderField: "authorization")
        }
        
        return urlRequest
    }

    private func decodeJsonResponse<T: Decodable>(data: Data, responseType: T.Type) -> T?
    {
        let decoder = createJsonDecoder()
        do {
            return try decoder.decode(responseType, from: data)
        }catch let error {
            debugPrint("error while decoding JSON response =>\(error.localizedDescription)")
        }
        return nil
    }

    // MARK: - GET Api call
    private func getData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(Result<T?, APIError>)-> Void)
    {
        var urlRequest = self.createUrlRequest(requestUrl: requestUrl)
        urlRequest.httpMethod = HTTPMethod.get.rawValue

        performRequest(requestUrl: urlRequest, responseType: T.self) { (result) in
            completionHandler(result)
        }
    }

    // MARK: - POST Api call
    private func postData<T:Decodable>(request: APIRequest, resultType: T.Type, completionHandler:@escaping(Result<T?, APIError>)-> Void)
    {
        var urlRequest = self.createUrlRequest(requestUrl: request.url)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.httpBody = request.requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        performRequest(requestUrl: urlRequest, responseType: T.self) { (result) in
            completionHandler(result)
        }
    }

    // MARK: - PUT Api call
    private func putData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(Result<T?, APIError>)-> Void)
    {
        var urlRequest = self.createUrlRequest(requestUrl: requestUrl)
        urlRequest.httpMethod = HTTPMethod.put.rawValue

        performRequest(requestUrl: urlRequest, responseType: T.self) { (result) in
            completionHandler(result)
        }
    }

    // MARK: - DELETE Api call
    private func deleteData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(Result<T?, APIError>)-> Void)
    {
        var urlRequest = self.createUrlRequest(requestUrl: requestUrl)
        urlRequest.httpMethod = HTTPMethod.delete.rawValue

        performRequest(requestUrl: urlRequest, responseType: T.self) { (result) in
            completionHandler(result)
        }
    }

    // MARK: - Perform data task
    private func performRequest<T: Decodable>(requestUrl: URLRequest, responseType: T.Type, completionHandler:@escaping(Result<T?, APIError>) -> Void)
    {
        
        self.getSession().dataTask(with: requestUrl) { (data, httpUrlResponse, error) in

            let statusCode = (httpUrlResponse as? HTTPURLResponse)?.statusCode
            if(error == nil && data != nil && data?.count != 0) {
                let response = self.decodeJsonResponse(data: data!, responseType: responseType)
                if(response != nil) {
                    completionHandler(.success(response))
                }else {
                    completionHandler(.failure(APIError(withServerResponse: data, forRequestUrl: requestUrl.url!, withHttpBody: requestUrl.httpBody, errorMessage: error.debugDescription, forStatusCode: statusCode!)))
                }
            }
            else {
                let networkError = APIError(withServerResponse: data, forRequestUrl: requestUrl.url!, withHttpBody: requestUrl.httpBody, errorMessage: error.debugDescription, forStatusCode: statusCode!)
                completionHandler(.failure(networkError))
            }

        }.resume()
    }
}

