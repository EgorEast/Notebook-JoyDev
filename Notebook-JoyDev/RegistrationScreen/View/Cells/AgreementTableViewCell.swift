//
//  AgreementTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 18.01.2022.
//

import UIKit

class AgreementTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Согласен с правилами"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
        setupSwitch()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSwitch() {
        mySwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
    }
    
    @objc func toggleSwitch(sender: UISwitch) {
        print(sender.isOn)
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(label)
        containerView.addSubview(mySwitch)
        
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: label.font.lineHeight),
            
            mySwitch.topAnchor.constraint(equalTo: containerView.topAnchor),
            mySwitch.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mySwitch.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30),
            mySwitch.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
}
