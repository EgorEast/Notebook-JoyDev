//
//  EventsTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import UIKit

enum EventsConstants {
    static let cellHeight = UIScreen.main.bounds.height * 0.1
    static var avatarSize: Double = {
        return EventsConstants.cellHeight * 0.7
    }()
}

final class EventsTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description text"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var daysLeftNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var daysTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "days"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "EmptyAvatar")
        )
        imageView.frame.size = CGSize(width: EventsConstants.avatarSize, height: EventsConstants.avatarSize)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
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
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        setupLabels()
        setupAvatar()
    }
    
    private func setupAvatar() {
        containerView.addSubview(avatarImageView)
    }
    
    private func setupLabels() {
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(daysLeftNumberLabel)
        containerView.addSubview(daysTitleLabel)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLeftNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        daysTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let lessWidthConstraintNameLabel = NSLayoutConstraint(
            item: nameLabel,
            attribute: .width,
            relatedBy: .lessThanOrEqual,
            toItem: containerView,
            attribute: .width,
            multiplier: 0.65,
            constant: 0
        );
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: containerView.superview?.leftAnchor ?? contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: containerView.superview?.topAnchor ?? contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: containerView.superview?.rightAnchor ?? contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.superview?.bottomAnchor ?? contentView.bottomAnchor),
            
            
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3),
            avatarImageView.heightAnchor.constraint(equalToConstant: EventsConstants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: EventsConstants.avatarSize),
            
            
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 4),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            lessWidthConstraintNameLabel,
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.font.lineHeight),
            
            
            descriptionLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 4),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.font.lineHeight),
            
            daysTitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            daysTitleLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            daysTitleLabel.heightAnchor.constraint(equalToConstant: daysTitleLabel.font.lineHeight),
            
            daysLeftNumberLabel.rightAnchor.constraint(equalTo: daysTitleLabel.leftAnchor, constant: -3),
            daysLeftNumberLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            daysLeftNumberLabel.heightAnchor.constraint(equalToConstant: daysLeftNumberLabel.font.lineHeight),
        ])
    }
    
}

