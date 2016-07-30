//
//  FormRepository.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import Foundation
import CoreData

protocol FormRepository {
  
  init(context: NSManagedObjectContext)
  
  func save(firstName firstName: String,
    lastName: String,
    questionOne: Bool,
    questionTwo: Bool,
    questionThree: Bool,
    questionFour: Bool) throws -> Form
  func fetchAll() throws -> [Form]
}

class FormRepositoryImpl: FormRepository {
  
  let context: NSManagedObjectContext
  
  required init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  func save(firstName firstName: String,
    lastName: String,
    questionOne: Bool,
    questionTwo: Bool,
    questionThree: Bool,
    questionFour: Bool) throws -> Form {
      
      let form = Form(context: context,
        firstName: firstName,
        lastName: lastName,
        questionOne: questionOne,
        questionTwo: questionTwo,
        questionThree: questionThree,
        questionFour: questionFour)
      
      try context.save()
      
      return form
  }
  
  func fetchAll() throws -> [Form] {
    let fetchRequest = NSFetchRequest(entityName: Form.entityName)
    let result = try context.executeFetchRequest(fetchRequest) as! [Form]
    return result
  }
}