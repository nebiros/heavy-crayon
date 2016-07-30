//
//  Form.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import Foundation
import CoreData

final class Form: NSManagedObject {
  
  internal static let entityName = "Form"
  let questionValue = 25.0
  
  @NSManaged var firstName: String
  @NSManaged var lastName: String
  @NSManaged var questionOne: Bool
  @NSManaged var questionTwo: Bool
  @NSManaged var questionThree: Bool
  @NSManaged var questionFour: Bool
  
  convenience init(context: NSManagedObjectContext, firstName: String,
    lastName: String,
    questionOne: Bool,
    questionTwo: Bool,
    questionThree: Bool,
    questionFour: Bool) {
      
      let entity = NSEntityDescription.entityForName(Form.entityName, inManagedObjectContext: context)!
      self.init(entity: entity, insertIntoManagedObjectContext: context)
      
      self.firstName = firstName
      self.lastName = lastName
      self.questionOne = questionOne
      self.questionTwo = questionTwo
      self.questionThree = questionThree
      self.questionFour = questionFour
  }
  
  @objc
  private override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  func calculateDiagnosis() -> Double {
    var total: Double = 0
    
    if questionOne == true {
      total += questionValue
    }
    
    if questionTwo == true {
      total += questionValue
    }
    
    if questionThree == true {
      total += questionValue
    }
    
    if questionFour == true {
      total += questionValue
    }
    
    return total
  }
}
