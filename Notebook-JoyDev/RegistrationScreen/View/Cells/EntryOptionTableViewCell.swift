//
//  EntryOptionTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 18.01.2022.
//

import UIKit

class EntryOptionTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    
    private var segmentedControl = UISegmentedControl(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
        setupSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        segmentedControl = UISegmentedControl(items: ["Вход", "Регистрация"])
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(segmentedControl)
    }

    private func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.selectedSegmentIndex = 1
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            let segmentTitle = target.titleForSegment(at: segmentIndex)
            print(segmentTitle ?? "")
            
        }
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60),
            
            segmentedControl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            segmentedControl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            segmentedControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
}
