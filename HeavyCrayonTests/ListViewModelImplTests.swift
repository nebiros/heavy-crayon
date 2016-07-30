//
//  ListViewModelTests.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/30/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import XCTest
@testable import HeavyCrayon

class ListViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testFetchAll() {
    class MockFormRepositoryImpl: FormRepositoryImpl {
      var fetchAllWasCalled = false
      
      override private func fetchAll() throws -> [Form] {
        fetchAllWasCalled = true
        
        return try! super.fetchAll()
      }
    }
    
    let context = MockNSManagedObjectContext.setUpInMemoryManagedObjectContext()
    let repository = MockFormRepositoryImpl(context: context)
    let viewModel = ListViewModelImpl(repository: repository)
    
    viewModel.fetchAll()
    
    XCTAssertTrue(repository.fetchAllWasCalled)
  }
}
