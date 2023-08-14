//
//  PersonsModuleTest.swift
//  MVP_ExampleTests
//
//  Created by Viktor Golovach on 10.08.2023.
//

import XCTest
@testable import MVP_Example

class MockView: UserViewProtocol {
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        titleTest = greeting
    }
    
}


final class PersonsModuleTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: UserMainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(name: "Baz", surname: "Bar")
        presenter = UserMainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }

    func testPersonModel() {
        XCTAssertEqual(person.name, "Baz")
        XCTAssertEqual(person.surname, "Bar")
    }
    
    
}
