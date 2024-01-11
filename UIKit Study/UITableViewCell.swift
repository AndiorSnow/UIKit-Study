//
//  UITableViewCell.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/11.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    let width: CGFloat = UIScreen.main.bounds.width
    var userLabel: UILabel!      // name
    var birthdayLabel: UILabel!  // birthday
    var sexLabel: UILabel!       // sex
    var iconImv: UIImageView!    // avatar
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // avatar
        iconImv = UIImageView(frame: CGRect(x: 20, y: 15, width: 44, height: 44))
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 22.0
        
        // name
        userLabel = UILabel(frame: CGRect(x: 74, y: 18, width: 70, height: 15))
        userLabel.textColor = UIColor.black
        userLabel.font = UIFont.boldSystemFont(ofSize: 15)
        userLabel.textAlignment = .left
        
        // sex
        sexLabel = UILabel(frame: CGRect(x: 150, y: 20, width: 50, height: 13))
        sexLabel.textColor = UIColor.black
        sexLabel.font = UIFont.systemFont(ofSize: 13)
        sexLabel.textAlignment = .left
        
        // birthday
        birthdayLabel = UILabel(frame: CGRect(x: 74, y: 49, width: width-94, height: 13))
        birthdayLabel.textColor = UIColor.gray
        birthdayLabel.font = UIFont.systemFont(ofSize: 13)
        birthdayLabel.textAlignment = .left
        
        contentView.addSubview(iconImv)
        contentView.addSubview(userLabel)
        contentView.addSubview(sexLabel)
        contentView.addSubview(birthdayLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
