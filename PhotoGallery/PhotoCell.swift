//
//  PhotoCell.swift
//  PhotoGallery
//
//  Created by MacBookPro on 08.02.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let reuseId = "PhotoCell"
    
    private let checkmark: UIImageView = {
        let image = UIImage(named: "checkmark")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    private let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.9656391111, green: 0.9695993165, blue: 1, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoImageView()
        setupCheckmarkView()
    }
    
    private func setupPhotoImageView() {
        addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    private func setupCheckmarkView() {
        addSubview(checkmark)
        NSLayoutConstraint.activate([
            checkmark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8),
            checkmark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
