//
//  HomeViewController.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 27/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import UIKit

class MountListViewController: UIViewController {

    let viewModel = MountListViewModel()

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
        tableView.register(UINib(nibName: "MountListCell", bundle: nil),
                           forCellReuseIdentifier: "MountListCell")
    }
}

extension MountListViewController: UITableViewDelegate,
                                   UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, 
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, 
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMounts().count
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MountListCell",
            for: indexPath) as? MountListCell
        else {
            return UITableViewCell()
        }

        let mount = viewModel.getMounts()[indexPath.row]
        cell.setup(for: mount)
        return cell
    }
}
