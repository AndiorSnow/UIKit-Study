//
//  UICollectionViewCell.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/12.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    var cellIndex: Int = 0 {
        didSet {
            textLabel.text = "\(cellIndex)"
        }
    }
    
    private var textLabel: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        textLabel = UILabel()
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
        backgroundColor = .lightGray
        
    }
    
    // For waterfall flow layouts with variable control sizes, the frame needs to be calculated here, otherwise it should be directly calculated in init()
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = bounds
    }
    
    // Set the background color when selected
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .orange
            } else {
                contentView.backgroundColor = nil
            }
            super.isSelected = isSelected
        }
    }
    
    // Set the highlight color when clicked
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                contentView.backgroundColor = .purple
            } else {
                contentView.backgroundColor = nil
            }
            super.isHighlighted = isHighlighted
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
