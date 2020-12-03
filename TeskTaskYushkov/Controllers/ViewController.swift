//
//  ViewController.swift
//  TeskTaskYushkov
//
//  Created by Иван Юшков on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {

    var habits = [Habit]()
    let urlSrtring = "https://stg.ultiself.com/api/commands/get-habit-short-info-list"
    
    //MARK: - Create Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hidden tableview and disable button before search 
        tableView.isHidden = true
        searchButton.isEnabled = false
        
        //delegate appointed in interface builder
        
        textField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }

   //MARK: - search button action
    @IBAction func searchAction(_ sender: UIButton) {
        guard let searchText = textField.text else { return }
        NetworkManager.postRequset(urlString: urlSrtring, searchText: searchText) { [weak self] (habits) in
            DispatchQueue.main.async {
                self?.habits = habits
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
    }
    
    //MARK: - method for observe editing name text field
    @objc func textFieldDidChanged() {
        if textField.text?.isEmpty == false {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
    
}

//MARK: - Table view data source & delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        let habit = habits[index]
       
        //create top row of table
        cell.numberLable.text = index == 0 ? " #" : " " + String(index)
        
        cell.titleLable.text = " " + habit.title
        cell.idLable.text = " " + habit.id
        
        cell.backgroundColor = index == 0 ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
}

//MARK: - Text field Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
