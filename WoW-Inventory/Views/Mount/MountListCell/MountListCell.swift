//
//  MountListCell.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 19/10/2023.
//

import UIKit

class MountListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        setupUI()
    }

    override func prepareForReuse() {
        nameLabel.text = nil
        favoriteImageView.isHidden = false
    }

    func setupUI() {
        selectionStyle = .none

        nameLabel.font = UIFont.morpheus(size: 20)
    }

    func setup(for mount: Mount) {
        nameLabel.text = mount.detail.name

        let hideFavIcon = !(mount.isFavorite ?? false)
        favoriteImageView.isHidden = hideFavIcon
    }

}
