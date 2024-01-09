//
//  TokenPriceView.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 08/01/2024.
//

import UIKit

class TokenPriceView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var priceImageView: UIImageView!
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(contentView)
    }

    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first
                as? UIView else { return UIView() }

        setupUI()
        return nibView
    }

    func setupUI() {
        contentView
            .backgroundColor(.systemBrown)
            .cornerRadius(10)
            .basicShadow()

        priceImageView.image = UIImage(named: "wow-token")
        priceImageView
            .cornerRadius(priceImageView.bounds.width / 2)

        tokenLabel.text = "TOKEN_PRICE_LABEL".localized
        tokenLabel.font = UIFont.lifeCraft(size: 20)

        priceLabel.font = UIFont.lifeCraft(size: 24)
        priceLabel.textColor = .systemYellow
    }

    func setupData(with tokenPrice: String) {
        priceLabel.text = "\(tokenPrice) G"
    }
}
