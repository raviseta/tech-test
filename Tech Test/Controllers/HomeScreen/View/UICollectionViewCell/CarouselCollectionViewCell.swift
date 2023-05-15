//
//  CarouselCollectionViewCell.swift
//  CarouselSample
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    
    static let identifier: String = "CarouselCollectionViewCell"

    // MARK: - AwakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.setCorner(radius: 6.0)
    }

    // MARK: - Setup
    
    private
    func setupUI() {
        self.imageView.contentMode = .scaleToFill
    }
    
    func setup(countryFlag: UIImage?) {
        self.imageView.image = countryFlag
    }
}
