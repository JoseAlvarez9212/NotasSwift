//
//  NotaCollectionViewCell.swift
//  NotasSwift
//
//  Created by Jose on 09/03/23.
//

import UIKit

class NotaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func prepareForReuse() {
        dateLabel.text = ""
        messageLabel.text = ""
    }
    
    func setup(message:String, date:Date){
        messageLabel.text = message
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/YY"
        dateLabel.text = dateFormat.string(from: date)
    }
    
}
