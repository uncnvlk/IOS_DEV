//
//  FriendsViewController.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 16.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var FriendItem: [FriendsDisplayItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.basic, forCellReuseIdentifier: R.Cell.basic)
        self.getData()
    }
    
    private func getData() {
        let mockItems: [FriendsDisplayItem] = [
            .init(friend: "Олег"),
            .init(friend: "Катя"),
            .init(friend: "Саша"),
            .init(friend: "Никита")
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.FriendItem = mockItems
            self.tableView.reloadData()
        }
    }
}

extension FriendsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FriendItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return tableView.dequeueReusableCell(withIdentifier: R.Cell.basic, for: indexPath)
    }
}

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? BasicTableViewCell)?.configure(with: self.FriendItem[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
