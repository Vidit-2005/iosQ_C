//
//  SummarizedReportCollectionViewCell.swift
//  wellSync
//
//  Created by GEU on 04/02/26.
//

import UIKit

class SummarizedReportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(){
        titleLabel.text = "Summarized Report"
        textLabel1.text = "Feeling Confident"
        textLabel2.text = "Extra workload is affecting my productivity"
        textLabel3.text = "Feelng Lassitude most of the Time"
    }

}
