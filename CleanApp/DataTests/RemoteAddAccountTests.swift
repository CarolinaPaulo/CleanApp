//
//  DataTests.swift
//  DataTests
//
//  Created by Carolina Paulo on 05/05/25.
//

import XCTest

class RemoteAddAccount {
    
    private let url: URL
    private let client: HttpPostClient
    
    init(url: URL, client: HttpPostClient) {
        self.url = url
        self.client = client
    }
    
    func add() {
        client.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

class HttpClientSpy: HttpPostClient {
    var url: URL?

    func post(url: URL) {
        self.url = url
    }
}

final class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, client: httpClient)
        sut.add()
        
        XCTAssertEqual(httpClient.url, url)
        
    }

}
