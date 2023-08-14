//
//  PersonsModuleTest.swift
//  MVP_ExampleTests
//
//  Created by Viktor Golovach on 10.08.2023.
//

import XCTest
@testable import MVP_Example

class MockView: UserViewProtocol {
    func onSuccess() {
        
    }
    
    func onFailure(with error: String) {
        
    }
    
}

class MockNetworkService: NetworkServiceProtocol {
    var users: [User]!
    
    init() {}
    
    convenience init(users: [User]?) {
        self.init()
        self.users = users
    }
    
    func fetchUsers() async -> (Result<[MVP_Example.User]?, Error>) {
        if let users = users {
            return .success(users)
        } else {
            let error = NSError(domain: "", code: 0)
            return .failure(error)
        }
    }
    
    
}


final class PersonsModuleTest: XCTestCase {
    
    var view: MockView!
    var presenter: UserMainPresenter!
    var networkService: NetworkServiceProtocol!
    var router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyModuleBuilder())
    var users = [User]()
    
    
    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testSuccesUserFetch() {
        let user = User(
            name: "Baz",
            username: "Bar",
            email: "Foo",
            phone: "Fubar",
            website: "Fubaz")
        users.append(user)
        
        view = MockView()
        networkService = MockNetworkService(users: [user])
        
        presenter = UserMainPresenter(
            view: view,
            networkService: networkService,
            router: router)
        
        Task { [weak self] in
            guard let self = self else {return}
            //to cathc result
            var catchUser: [User]?
            let result = await networkService.fetchUsers()
            switch result {
            case .success(let users):
                catchUser = users
            case .failure(let error):
                print(error)
            }
            XCTAssertNotEqual(catchUser?.count, 0)
            XCTAssertEqual(catchUser?.count, users.count)
        }
    }
    
    
}
