//
//  TableViewCell.swift
//  TeskTaskYushkov
//
//  Created by Иван Юшков on 03.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var numberLable: UILabel! {
        didSet {
            numberLable.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            numberLable.layer.borderWidth = 0.4
        }
    }
    @IBOutlet weak var titleLable: UILabel! {
        didSet {
            titleLable.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            titleLable.layer.borderWidth = 0.4
        }
    }
    @IBOutlet weak var idLable: UILabel! {
        didSet {
            idLable.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            idLable.layer.borderWidth = 0.4
        }
    }
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            stackView.frame = self.contentView.bounds
        }
    }
   
}
