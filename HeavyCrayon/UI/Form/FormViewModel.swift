//
//  FormViewModel.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import UIKit

protocol FormViewModelDelegate: class {
  
  func showError(error: ErrorType?)
  func backtToList()
}

protocol FormViewModel {
  
  weak var delegate: FormViewModelDelegate? { get set }
  var questionOneSwitchOn: Bool { get }
  var questionTwoSwitchOn: Bool { get }
  var questionThreeSwitchOn: Bool { get }
  var questionFourSwitchOn: Bool { get }
  
  func saveData(firstName firstName: String?,
    lastName: String?,
    questionOne: Bool,
    questionTwo: Bool,
    questionThree: Bool,
    questionFour: Bool)
}

class FormViewModelImpl: FormViewModel {
  
  let repository: FormRepository?
  
  weak var delegate: FormViewModelDelegate?
  var questionOneSwitchOn: Bool { return false }
  var questionTwoSwitchOn: Bool { return false }
  var questionThreeSwitchOn: Bool { return false }
  var questionFourSwitchOn: Bool { return false }
  
  init(repository: FormRepository) {
    self.repository = repository
  }
  
  func saveData(firstName firstName: String?,
    lastName: String?,
    questionOne: Bool,
    questionTwo: Bool,
    questionThree: Bool,
    questionFour: Bool) {
      
      if let firstName = firstName, lastName = lastName {
        do {
          try repository?.save(firstName: firstName,
            lastName: lastName,
            questionOne: questionOne,
            questionTwo: questionTwo,
            questionThree: questionThree,
            questionFour: questionFour)
        } catch let error as NSError {
          delegate?.showError(error); return
        }
        
        delegate?.backtToList()
      }
  }
}
