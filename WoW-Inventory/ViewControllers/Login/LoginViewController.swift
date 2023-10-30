//
//  LoginViewController.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 27/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    private var viewModel = LoginViewModel()

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var inventoryLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupText()
    }

    func setupUI() {
        welcomeLabel.font = UIFont.lifeCraft(size: 40)
        welcomeLabel.numberOfLines = 0

        inventoryLabel.font = UIFont.lifeCraft(size: 40)
        inventoryLabel.numberOfLines = 0

        loginButton.titleLabel?.font = UIFont.lifeCraft(size: 30)
        loginButton.layer
            .cornerRadius(4)
            .basicShadow()
    }

    func setupText() {
        welcomeLabel.text = "LOGIN_WELCOME_LABEL".localized
        inventoryLabel.text = "LOGIN_WELCOME_LABEL_2".localized
        loginButton.setTitle("LOGIN_CONNEXION_BUTTON".localized, for: .normal)
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        let accessToken = viewModel.getAccessToken()
        if accessToken.isEmpty {
            logInWithBlizzard()
        } else {
            checkTokenAvailability(accessToken)
        }
    }

    func checkTokenAvailability(_ accessToken: String) {
        viewModel.checkAccessToken(accessToken) { [weak self] success in
            if success {
                self?.goToHome()
            } else {
                self?.logInWithBlizzard()
            }
        }
    }

    func logInWithBlizzard() {
        // Blizzard OAuth URL
        guard let authURL = URL(string: "https://oauth.battle.net/authorize?" +
                                "client_id=\(WICredentials.shared.clientID)" +
                                "&redirect_uri=\(WICredentials.shared.redirectUri)" +
                                "&response_type=code" +
                                "&region=eu" +
                                "&scope=wow.profile") else {
            return
        }

        let safariVC = SFSafariViewController(url: authURL)
        safariVC.delegate = self
        present(safariVC, animated: true)
    }

    func goToHome() {
        performSegue(withIdentifier: WISegue.loginToHome.rawValue,
                     sender: self)
    }
}

extension LoginViewController: SFSafariViewControllerDelegate {
    
    func safariViewController(_ controller: SFSafariViewController,
                              initialLoadDidRedirectTo URL: URL) {
        if URL.absoluteString.contains("/?code=") {
            let splitUrl = URL.absoluteString.split(separator: "=")
            let authToken = String(splitUrl[1])
            viewModel.fetchAccessToken(authToken) { [weak self] success in
                if success {
                    self?.goToHome()
                }
                controller.dismiss(animated: true)
            }
        }
    }
    
}
