//
//  HomeCell.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 19/10/2023.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        setupUI()
    }

    func setupUI() {
        nameLabel.font = UIFont.lifeCraft(size: 16)
    }

    func setup(for cellType: HomeCellType) {
        backgroundColor = cellType.backgroundColor

        iconImageView.image = UIImage(named: cellType.iconName)

        nameLabel.text = cellType.name
    }
}
