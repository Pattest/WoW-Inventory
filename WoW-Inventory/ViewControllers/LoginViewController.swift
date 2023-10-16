//
//  LoginViewController.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 27/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import Moya

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView?
    @IBOutlet weak var loginButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        logInWithBlizzard()
    }

    func logInWithBlizzard() {
        //Blizzard OAuth URL
        guard let authURL = URL(string: "https://oauth.battle.net/authorize?" +
                                "client_id=\(BlizzardCredentials.shared.clientID)" +
                                "&redirect_uri=\(BlizzardCredentials.shared.redirectUri)" +
                                "&response_type=code" +
                                "&region=eu" +
                                "&scope=wow.profile") else {
            return
        }

        let safariVC = SFSafariViewController(url: authURL)
        safariVC.delegate = self
        present(safariVC, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }

    func goToHome() {
        performSegue(withIdentifier: "LoginToHome",
                     sender: self)
    }
}

extension LoginViewController: SFSafariViewControllerDelegate {
    
    func safariViewController(_ controller: SFSafariViewController,
                              initialLoadDidRedirectTo URL: URL) {
        if URL.absoluteString.contains("/?code=") {
            let splitUrl = URL.absoluteString.split(separator: "=")
            let authorizationToken = String(splitUrl[1])
            DataManager.shared.getAccessToken(code: authorizationToken) { [weak self] success in
                if success {
                    self?.goToHome()
                }
            }
            controller.dismiss(animated: true)
        }
    }
    
}
