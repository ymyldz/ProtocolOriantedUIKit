//
//  ProtocolOriantedUIKitTests.swift
//  ProtocolOriantedUIKitTests
//
//  Created by Yusuf Mert Yıldız on 16.05.2023.
//

import XCTest
@testable import ProtocolOriantedUIKit

final class ProtocolOriantedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    
    private var userService : MockUserService!
    
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testExample() throws {
        
        
    }
    
    func testUpdateView_whenAPISucces_showsNameUsernameEmail() throws {
        let mock = User(id: 1, name: "Yusuf", username: "ymyldz", email: "ymyldz1905@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: .init(lat: "", lng: "")), phone: "", website: "", company: .init(name: "", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mock)
        
        userViewModel.fetchUser()
        
        XCTAssertEqual(output.updateArray.first?.userName, "ymyldz")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())

        userViewModel.fetchUser()

        XCTAssertEqual(output.updateArray.first?.name, "No user")
    }
    
    class MockUserService : UserService {
        var fetchUserMockResult : Result<ProtocolOriantedUIKit.User, Error>?
        func fetchUser(completion: @escaping (Result<ProtocolOriantedUIKit.User, Error>) -> Void) {
            if let result = fetchUserMockResult {
                completion(result)
            }
        }
        
        
    }
    class MockUserViewModelOutput : UserViewModelOutput {
        var updateArray : [(name:String,userName:String,email:String)] = []
        
        func updateView(name: String, username: String, email: String) {
            updateArray.append((name,username,email))
        }
        
        
        
    }
}
