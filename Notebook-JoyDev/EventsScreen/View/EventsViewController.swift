//
//  EventsViewController.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import UIKit

final class EventsViewController: UIViewController {
    
    private var eventsViewModel = EventsViewModelImpl()
    
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: .init(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(AddEventViewController(), animated: true)
        }), menu: nil)
        self.view.addSubview(self.tableView)
    }
    
//    @objc func clickAddButton() {
//
//    }
    
    private func setupTableView() {
        self.tableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "EventsTableViewCell")
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = EventsConstants.cellHeight
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

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return self.eventsViewModel.data.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as! EventsTableViewCell
        cell.nameLabel.text = eventsViewModel.data[indexPath.row]
        return cell
    }
}

extension EventsViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(AddEventViewController(), animated: true)
    }
}

