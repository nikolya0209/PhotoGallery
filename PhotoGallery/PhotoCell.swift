//
//  PhotoCell.swift
//  PhotoGallery
//
//  Created by MacBookPro on 08.02.2022.
//

import UIKit
import SDWebImage

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
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
            
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelected()        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateSelected()
        setupPhotoImageView()
        setupCheckmarkView()
    }
    
    private func updateSelected() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
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
