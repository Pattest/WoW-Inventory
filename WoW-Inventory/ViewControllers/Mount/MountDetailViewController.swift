//
//  MountDetailViewController.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 19/10/2023.
//

import UIKit
import AlamofireImage

class MountDetailViewController: UIViewController {

    private let viewModel = MountDetailViewModel()
    
    @IBOutlet weak var mountImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var iconLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupText(for: viewModel.mount)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = nil
    }

    func prepareData(mount: Mount?) {
        viewModel.mount = mount
    }

    func setupUI() {
        nameLabel.font = UIFont.lifeCraft(size: 40)
        nameLabel.numberOfLines = 2

        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0

        iconLabels.forEach { iconLabel in
            iconLabel.font = UIFont.lifeCraft(size: 60)
        }
    }

    func setupText(for mount: Mount?) {
        guard let mount else { return }

        if let creatureDisplay = mount.detail.creatureDisplays?.first {
            viewModel.fetchCreatureDisplayMedia(id: creatureDisplay.id) {
                self.setupImageView(with: self.viewModel.assets)
            }
        }
        nameLabel.text = mount.detail.name

        if let faction = mount.detail.faction,
           let factionType = FactionType(rawValue: faction.type) {

            iconLabels.forEach { iconLabel in
                iconLabel.text = factionType.iconName
                iconLabel.textColor = factionType.iconColor
            }
        } else {
            iconLabels.forEach { $0.removeFromSuperview() }
        }

        descriptionLabel.text = mount.detail.getDescription()
    }

    // TODO: Create carousel if multiple assets
    func setupImageView(with assets: [Asset]) {
        guard let firstAsset = assets.first else { return }

        mountImageView.af.setImage(
            withURL: URL(string: firstAsset.value)!,
            imageTransition: .crossDissolve(0.2)
        )
    }

}
