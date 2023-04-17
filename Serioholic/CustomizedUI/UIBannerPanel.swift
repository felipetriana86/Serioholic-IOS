//
//  UIBannerPanel.swift
//  Serioholic
//
//  Created by english on 2023-03-29.
//

import UIKit
class UIBannerPanel : UIView{
    
    
    public var bannerTitle : String? {
        didSet{
            lblBanerTitle.text = bannerTitle
        }
    }
    public var logo : UIImage?{
        didSet{
            logoImage.image = logo
        }
    }
    
    private let lblBanerTitle : UILabel = {
        
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.textColor = .white
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
        
    }()
    
    private let logoImage :UIImageView =
    {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        
        self.addSubviews(lblBanerTitle, logoImage)
    }
    
    private func applyConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.heightAnchor.constraint(equalToConstant: 120),
            
            lblBanerTitle.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            lblBanerTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lblBanerTitle.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            lblBanerTitle.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
