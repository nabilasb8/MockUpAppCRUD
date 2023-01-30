//
//  ViewController.swift
//  Pelindo Test
//
//  Created by Nabila on 29/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let userApiManager = UserApiManager()
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List Users"
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpRightBarButton()
        getAllUser()
    }
    
    func setUpRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickButtonAdd))
    }
    
    @objc func onClickButtonAdd() {
        addUser()
    }
    
}

// MARK: - API CALL
extension ViewController {
    func getAllUser() {
        userApiManager.getAllUser { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func addUser() {
        let user = User(
            userid: nil,
            namalengkap: "Nabila",
            username: "nabilas",
            password: "nabil",
            status: "active"
        )
        
        userApiManager.setUserData(user: user) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    print(message)
                    self?.getAllUser()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let user = users[indexPath.row]
            userApiManager.deleteUser(userID: user.userid ?? 0) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let message):
                        print(message)
                        self?.getAllUser()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = user.namalengkap
        
        return cell
    }
}

