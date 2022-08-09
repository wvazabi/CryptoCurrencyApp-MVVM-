//
//  CryptoCell.swift
//  CrazyCrypto
//
//  Created by Enes Kaya on 9.08.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    @IBOutlet weak var crytoCurrencyText: UILabel!
    
    @IBOutlet weak var cryptoToUsdtText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
