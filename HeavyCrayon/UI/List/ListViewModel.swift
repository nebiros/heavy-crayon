//
//  ListViewModel.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import UIKit

protocol ListViewModelDelegate: class {
  
  func showError(error: ErrorType?)
  func reloadData(data: [Form])
}

protocol ListViewModel {
  
  weak var delegate: ListViewModelDelegate? { get set }
  
  func fetchAll()
}

class ListViewModelImpl: ListViewModel {
  
  let repository: FormRepository?
  let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  
  weak var delegate: ListViewModelDelegate?
  
  init(repository: FormRepository) {
    self.repository = repository
  }
  
  func fetchAll() {
    do {
      if let result = try repository?.fetchAll() {
        delegate?.reloadData(result); return
      }
    } catch let error as NSError {
      delegate?.showError(error)
    }
  }
}
