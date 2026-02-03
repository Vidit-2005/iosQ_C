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

        // Do any additional setup after loading the view.
        
        PatientProfileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        let layout = createLayout()
        PatientProfileCollectionView.setCollectionViewLayout(layout, animated: true)
        PatientProfileCollectionView.delegate = self
        PatientProfileCollectionView.dataSource = self
    }
    
}

extension PatientProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let profilecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        profilecell.configureCell()
        return profilecell
    }
}

extension PatientProfileViewController{

    func createLayout() -> UICollectionViewLayout{
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
