//
//  TextAttributeTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

enum TextAttributeConstants {
    static let cellHeight = UIScreen.main.bounds.height * 0.108
    
}

import UIKit

final class TextAttributeTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.75, green: 0.82, blue: 0.96, alpha: 1.00)
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Введите текст", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 16.0, weight: .bold)
        ])
        
        return textField
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func configure(data: ) {
    //
    //    }
    
    func setTitleLabel(string title: String) {
        titleLabel.text = title
    }
    func setPlaceholder(string text: String) {
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 16.0, weight: .bold)
        ])
    }
    func setDisablingTextField(bool: Bool) {
        textField.isUserInteractionEnabled = !bool
        textField.isEnabled = !bool
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(textField)
        containerView.addSubview(separator)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: containerView.superview?.leftAnchor ?? contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: containerView.superview?.topAnchor ?? contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: containerView.superview?.rightAnchor ?? contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.superview?.bottomAnchor ?? contentView.bottomAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30),
            titleLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -9),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.font.lineHeight),
            
            textField.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            textField.rightAnchor.constraint(equalTo: separator.rightAnchor),
            textField.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -12),
            
            separator.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            separator.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -70),
            separator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 3),
        ])
    }
    
}
