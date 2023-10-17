//
//  HomeViewController.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var disconnectButton: UIButton!

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
        print("Bearer: \(BlizzardCredentials.shared.getAccessToken())")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Actions

    @IBAction func disconnectButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
