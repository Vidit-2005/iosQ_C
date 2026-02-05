//
//  PatientProfileViewController.swift
//  wellSync
//
//  Created by GEU on 02/02/26.
//

import UIKit

class PatientProfileViewController: UIViewController {
    
    @IBOutlet weak var PatientProfileCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
//        let Profilelayout = createLayoutProfile()
//        let SessionNoteslayout = createLayoutSessionNotes()
        let Layout = generateLayout()
        PatientProfileCollectionView.setCollectionViewLayout(Layout, animated: true)
        
        PatientProfileCollectionView.delegate = self
        PatientProfileCollectionView.dataSource = self
    }
    
    func registerCells(){
        PatientProfileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        PatientProfileCollectionView.register(UINib(nibName: "SessionNotesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SessionNotesCollectionViewCell")
        PatientProfileCollectionView.register(UINib(nibName: "SummarizedReportCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SummarizedReportCollectionViewCell")
        PatientProfileCollectionView.register(UINib(nibName: "MoodCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "MoodCollectionViewCell")
    }
    
}

extension PatientProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let profilecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
            profilecell.configureCell()
            return profilecell }
        else if indexPath.section == 1{
            let sessionNotesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SessionNotesCollectionViewCell", for: indexPath) as! SessionNotesCollectionViewCell
            sessionNotesCell.configureCell()
            cardStyle(cell: sessionNotesCell)
            return sessionNotesCell
        }else if indexPath.section == 2{
            let summarizedReportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummarizedReportCollectionViewCell", for: indexPath) as! SummarizedReportCollectionViewCell
            summarizedReportCell.configureCell()
            cardStyle(cell: summarizedReportCell)
            return summarizedReportCell
        }else if indexPath.section == 3{
            let moodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoodCollectionViewCell", for: indexPath) as! MoodCollectionViewCell
            cardStyle(cell: moodCell)
            return moodCell
        }else{
            let summarizedReportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummarizedReportCollectionViewCell", for: indexPath) as! SummarizedReportCollectionViewCell
            summarizedReportCell.configureCell()
            cardStyle(cell: summarizedReportCell)
            return summarizedReportCell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
}

extension PatientProfileViewController{
    
    func generateLayout() -> UICollectionViewLayout {

           let layout = UICollectionViewCompositionalLayout { [weak self]
               sectionIndex, environment -> NSCollectionLayoutSection in

               guard let self = self else {
                   return self!.generateSectionForCells()
               }

               switch sectionIndex {
               case 0:
                   return self.generateSectionForProfile()
               default:
                   return self.generateSectionForCells()
               }
           }

           return layout
       }
    func cardStyle(cell:UICollectionViewCell){
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 16
        cell.layer.masksToBounds = false
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.separator.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.08
        cell.layer.shadowRadius = 10
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    func generateSectionForProfile() -> NSCollectionLayoutSection{
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        return section
    }
    
    func generateSectionForCells() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        return section
    }
}
