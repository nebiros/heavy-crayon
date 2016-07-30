//
//  ListViewController.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/29/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
  
  let cellIdentifier = "FormCell"
  let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  
  var viewModel: ListViewModel? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  var data = [Form]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    viewModel?.fetchAll()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == FormViewController.segueIdentifier {
      if let formVC = segue.destinationViewController as? FormViewController {
        let repository = FormRepositoryImpl(context: context)
        formVC.viewModel = FormViewModelImpl(repository: repository)
      }
    }
  }
  
  // MARK: - UITableViewDataSource
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
      ?? UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
    
    let form = data[indexPath.row]
    let diagnosis = form.calculateDiagnosis()
    
    cell.textLabel?.text = "\(form.firstName) \(form.lastName)"
    cell.detailTextLabel?.text = "Diagnosis: \(diagnosis)%"
    
    return cell
  }
}

extension ListViewController: ListViewModelDelegate {
  
  func showError(error: ErrorType?) {
  }
  
  func reloadData(data: [Form]) {
    self.data = data
    
    self.tableView.reloadData()
  }
}
