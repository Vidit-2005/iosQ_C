//
//  MoodAnalysisViewController.swift
//  wellSync
//
//  Created by Vidit Agarwal on 03/02/26.
//

import UIKit

class MoodAnalysisViewController: UIViewController {

    @IBOutlet weak var moodCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        moodCollection.register(UINib(nibName: "CalenderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "calender")
        let layout = generateLayout()
        moodCollection.collectionViewLayout = layout
        moodCollection.dataSource = self
    }
}
extension MoodAnalysisViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calender", for: indexPath) as! CalenderCollectionViewCell
        return cell
    }
    func generateLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(130))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
