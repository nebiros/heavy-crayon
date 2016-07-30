//
//  FormViewController.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
  
  static let segueIdentifier = "FormSegue"
  
  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var questionOneSwitch: UISwitch!
  @IBOutlet weak var questionTwoSwitch: UISwitch!
  @IBOutlet weak var questionThreeSwitch: UISwitch!
  @IBOutlet weak var questionFourSwitch: UISwitch!
  
  var viewModel: FormViewModel? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done,
      target: self,
      action: #selector(doneButtonTapped(_:)))
    
    configureAllViews()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Configure
  
  private func configureAllViews() {
    configureQuestionOne()
    configureQuestionTwo()
    configureQuestionThree()
    configureQuestionFour()
  }
  
  private func configureQuestionOne() {
    guard let viewModel = viewModel else {
      return
    }
    
    questionOneSwitch.on = viewModel.questionOneSwitchOn
  }
  
  private func configureQuestionTwo() {
    guard let viewModel = viewModel else {
      return
    }
    
    questionTwoSwitch.on = viewModel.questionTwoSwitchOn
  }
  
  private func configureQuestionThree() {
    guard let viewModel = viewModel else {
      return
    }
    
    questionThreeSwitch.on = viewModel.questionThreeSwitchOn
  }
  
  private func configureQuestionFour() {
    guard let viewModel = viewModel else {
      return
    }
    
    questionFourSwitch.on = viewModel.questionFourSwitchOn
  }
  
  // MARK: - Actions
  
  func doneButtonTapped(sender: UIBarButtonItem) {
    guard let viewModel = viewModel else {
      return
    }
    
    viewModel.saveData(firstName: firstName.text,
      lastName: lastName.text,
      questionOne: questionOneSwitch.on,
      questionTwo: questionTwoSwitch.on,
      questionThree: questionThreeSwitch.on,
      questionFour: questionFourSwitch.on)
    
  }
}

extension FormViewController: FormViewModelDelegate {
  
  func showError(error: ErrorType?) {
    
  }
  
  func backtToList() {
    self.navigationController?.popViewControllerAnimated(true)
  }
}

