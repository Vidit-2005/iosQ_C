import UIKit

class MoodLogCollectionViewController:
    UICollectionViewController,
    UICollectionViewDelegateFlowLayout {

    var selectedMoodColor: UIColor?
    var onDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let color = selectedMoodColor {
            view.backgroundColor = color.withAlphaComponent(0.15)
        }
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true) {
            self.onDismiss?()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MoodLog",
            for: indexPath
        )
        cell.layer.cornerRadius = 16
        cell.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowRadius = 8
        cell.layer.masksToBounds = false

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        CGSize(width: collectionView.frame.width, height: 180)
    }
}
