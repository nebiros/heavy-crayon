//
//  FormTests.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/30/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import XCTest
@testable import HeavyCrayon

class FormTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testSave() {
    let context = MockNSManagedObjectContext.setUpInMemoryManagedObjectContext()
    let form = Form(context: context, firstName: "Juan",
      lastName: "Alvarez",
      questionOne: true,
      questionTwo: true,
      questionThree: true,
      questionFour: false)
    
    do {
      try context.save()
    } catch let error as NSError {
      XCTAssertNil(error)
    }
    
    XCTAssertEqual(form.firstName, "Juan")
    XCTAssertEqual(form.lastName, "Alvarez")
    XCTAssertEqual(form.questionOne, true)
    XCTAssertEqual(form.questionTwo, true)
    XCTAssertEqual(form.questionThree, true)
    XCTAssertEqual(form.questionFour, false)
  }
  
  func testCalculateDiagnosis() {
    let context = MockNSManagedObjectContext.setUpInMemoryManagedObjectContext()
    let form = Form(context: context, firstName: "Juan",
      lastName: "Alvarez",
      questionOne: true,
      questionTwo: true,
      questionThree: true,
      questionFour: false)
    
    do {
      try context.save()
    } catch let error as NSError {
      XCTAssertNil(error)
    }
    
    let diagnosis = form.calculateDiagnosis()
    
    XCTAssertEqual(diagnosis, 75.0)
  }
}
