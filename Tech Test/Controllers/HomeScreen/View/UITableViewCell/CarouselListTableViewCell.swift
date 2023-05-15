//
//  CarouselListTableViewCell.swift
//  CarouselSample
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

class CarouselListTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak private var leadingImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    
    // MARK: - AwakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.leadingImageView.setCorner(radius: 6.0)
        self.leadingImageView.setBorder(width: 0.5)
    }
    
    // MARK: - Setup
    
    func setup(player: Player) {
        self.leadingImageView.image = player.image
        self.titleLabel.text = player.name
    }
    
}
