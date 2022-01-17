//
//  ViewController.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 11.01.2022.
//

import UIKit

final class MainViewController: UIViewController {

    private var mainViewModel = MainViewModelImpl()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        navigationItem.title = "Notebook"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView)
    }
    
    private func setupTableView() {
        self.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return self.mainViewModel.data.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.textLabel?.text = self.mainViewModel.data[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventsViewController = EventsViewController()
        eventsViewController.navigationItem.title = mainViewModel.data[indexPath.row]
        navigationController?.pushViewController(eventsViewController, animated: true)
    }
}
