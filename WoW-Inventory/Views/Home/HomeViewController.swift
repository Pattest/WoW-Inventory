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

    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupData()
        setupCollectionView()
        print("Bearer: \(WICredentials.shared.loadAccessToken())")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    func setupUI() {
        homeLabel.font = UIFont.lifeCraft(size: 50)
    }

    func setupData() {
        homeLabel.text = "HOME_NAV_TITLE".localized
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(UINib(nibName: "HomeCell", bundle: nil),
                                forCellWithReuseIdentifier: "HomeCell")
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
        return viewModel.cellTypes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeCell",
            for: indexPath) as? HomeCell
        else {
            return UICollectionViewCell()
        }

        let homeCellType = viewModel.cellTypes[indexPath.row]
        cell.setup(for: homeCellType)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let homeCellType =  viewModel.cellTypes[indexPath.row]
        switch homeCellType {
        case .mount:
            performSegue(withIdentifier: WISegue.homeToMountList.rawValue,
                         sender: nil)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width / 3,
                      height: view.bounds.width / 3)
    }

}
