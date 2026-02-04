//
//  SessionNotesCollectionViewCell.swift
//  wellSync
//
//  Created by GEU on 03/02/26.
//

import UIKit

class SessionNotesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var SessionNoteLabel: UILabel!
    @IBOutlet var notesLabel1: UILabel!
    @IBOutlet var notesLabel2: UILabel!
    @IBOutlet var notesLabel3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    

    func configureCell(){
        SessionNoteLabel.text = "Session Notes"
        notesLabel1.text = "Feeling depressive on Sunday evenings. I'm not sure if it's the work or the loneliness."
        notesLabel2.text = "Feeling Lonely and anxious. And not interested in social activities."
        notesLabel3.text = "Want to escape from People Interaction."
    }
}
