//
//  MockSessionDataPublisher.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

class MockSessionDataPublisher: SessionDataPublisher {
    convenience init(session: URLSession = URLSession.shared, mockDataHandler: (()->([URL?: Data]))? = nil) {
        URLProtocolMock.mockDataHandler = mockDataHandler

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        self.init(session: URLSession(configuration: config))
    }
}

class URLProtocolMock: URLProtocol {
    static var mockDataHandler: (()->([URL?: Data]))?
    static var response: URLResponse?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canInit(with task: URLSessionTask) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        var responseBody = Data()
        if let url = request.url {
            if let data = URLProtocolMock.mockDataHandler?()[url] {
                self.client?.urlProtocol(self, didLoad: data)
                responseBody = data
            }
            
            self.client?.urlProtocol(self,
                                     didReceive: URLResponse(url: request.url!, mimeType: nil, expectedContentLength: NSData(data: responseBody).length, textEncodingName: nil),
                                     cacheStoragePolicy: .notAllowed)
        }
        
        if let error = URLProtocolMock.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
