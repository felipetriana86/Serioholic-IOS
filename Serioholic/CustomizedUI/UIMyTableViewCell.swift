//
//  UITableViewCell.swift
//  Serioholic
//
//  Created by english on 2023-03-29.
//

import UIKit
class UIMyTableViewCell : UITableViewCell{
    
    public var serieImg : UIImage?{
        didSet{
            serieImage.image = serieImg
        }
    }
    
    public var starImg : UIImage?{
        didSet{
            starImage.image = starImg
        }
    }
    
    public var rating : String? {
        didSet{
            lblStar.text = rating
        }
    }
    
    public var serieTitle : String? {
        didSet{
            lblSerieTitle.text = serieTitle
        }
    }
    
    public var serieType : String? {
        didSet{
            lblSerieType.text = serieType
        }
    }
    
    public var serieYear : String? {
        didSet{
            lblSerieYear.text = serieYear
        }
    }
    
    public var ImageURL : String? {
        didSet{
            self.serieImage.fetchUImageFromURL(url: URL(string: ImageURL!)!)
        }
    }
    
    
    private var starImage : UIImageView = Helper.defaultImage(tintColor: .systemYellow)
    private var serieImage : UIImageView = Helper.defaultImage(tintColor: .clear)
    
    private var lblStar : UILabel = Helper.defaultLabel(text: "", fontSize: 15)
    private var lblSerieTitle : UILabel = Helper.defaultLabel(text: "", fontSize: 23)
    private var lblSerieType : UILabel = Helper.defaultLabel(text: "", fontSize: 18)
    private var lblSerieYear : UILabel = Helper.defaultLabel(text: "", fontSize: 18)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        contentView.addSubviews(lblSerieTitle, lblSerieType, serieImage, starImage, lblStar, lblSerieYear)
    }
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            
            serieImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            serieImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            serieImage.widthAnchor.constraint(equalToConstant: 100),
            serieImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            lblSerieTitle.leadingAnchor.constraint(equalTo: serieImage.trailingAnchor, constant: 10),
            lblSerieTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lblSerieTitle.topAnchor.constraint(equalTo: serieImage.topAnchor, constant: 10),
            
            
            lblSerieType.leadingAnchor.constraint(equalTo: serieImage.trailingAnchor, constant: 10),
            lblSerieType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lblSerieType.topAnchor.constraint(equalTo: lblSerieTitle.bottomAnchor, constant: 1),
            
            
            lblSerieYear.leadingAnchor.constraint(equalTo: serieImage.trailingAnchor, constant: 10),
            lblSerieYear.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lblSerieYear.topAnchor.constraint(equalTo: lblSerieType.bottomAnchor, constant: 5),
            
            
            starImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            starImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            starImage.heightAnchor.constraint(equalToConstant: 20),
            starImage.widthAnchor.constraint(equalToConstant: 20),
            
            lblStar.centerXAnchor.constraint(equalTo: starImage.centerXAnchor),
            lblStar.topAnchor.constraint(equalTo: starImage.bottomAnchor, constant: 2),
            
        ])
    }
}

