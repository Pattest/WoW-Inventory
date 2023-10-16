//
//  HomeViewController.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 27/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        viewModel.fetchMounts() { [weak self] success in
            if success {
                self?.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate,
                              UITableViewDataSource {
    func tableView(_ tableView: UITableView, 
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.mounts.count
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mount = viewModel.mounts[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(mount.mountInfo.name)"
        return cell
    }
}
