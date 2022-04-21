//
//  InitialMainViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 21.04.2022.
//

import UIKit

final class InitialMainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: InitialMainViewController.self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 1:
            performSegue(withIdentifier: "Set", sender: tableView)
        case 2:
            let viewController = DictionaryViewController()
            viewController.navigationItem.title = ": \(String(Int.random(in: 100...999)))"
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Array",
           let viewController = segue.destination as? ArrayViewController {
            viewController.navigationItem.title = ": \(String(Int.random(in: 1000...1999)))"
        }
        if segue.identifier == "Set",
           let viewController = segue.destination as? SetViewController {
            viewController.navigationItem.title = ": \(String(Int.random(in: 1...99)))"
        }
    }
}
