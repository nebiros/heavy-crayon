//
//  FormRepositoryTests.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/30/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import XCTest
import CoreData
@testable import HeavyCrayon

class FormRepositoryTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testSave() {
    let context = MockNSManagedObjectContext.setUpInMemoryManagedObjectContext()
    let repository = FormRepositoryImpl(context: context)
    
    do {
      let form = try repository.save(firstName: "Juan",
        lastName: "Alvarez",
        questionOne: true,
        questionTwo: true,
        questionThree: true,
        questionFour: false)
      
      try context.save()
      
      XCTAssertEqual(form.firstName, "Juan")
      XCTAssertEqual(form.lastName, "Alvarez")
      XCTAssertEqual(form.questionOne, true)
      XCTAssertEqual(form.questionTwo, true)
      XCTAssertEqual(form.questionThree, true)
      XCTAssertEqual(form.questionFour, false)
    } catch let error as NSError {
      XCTAssertNil(error)
    }
  }
  
  func testFetchAll() {
    class Context: MockNSManagedObjectContext {
      
      override private func executeFetchRequest(request: NSFetchRequest) throws -> [AnyObject] {
        return [Form(context: self,
          firstName: "Juan",
          lastName: "Alvarez",
          questionOne: true,
          questionTwo: true,
          questionThree: true,
          questionFour: false)]
      }
    }
    
    let context = Context.setUpInMemoryManagedObjectContext()
    let repository = FormRepositoryImpl(context: context)
    
    do {
      let result = try repository.fetchAll()
      if let form = result.first {
        XCTAssertEqual(form.firstName, "Juan")
        XCTAssertEqual(form.lastName, "Alvarez")
        XCTAssertEqual(form.questionOne, true)
        XCTAssertEqual(form.questionTwo, true)
        XCTAssertEqual(form.questionThree, true)
        XCTAssertEqual(form.questionFour, false)
      }
    } catch {
      fatalError("Fetch all forms failed")
    }
  }
}
