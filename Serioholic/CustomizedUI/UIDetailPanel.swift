//
//  UIDetailPanel.swift
//  Serioholic
//
//  Created by english on 2023-03-30.
//

import UIKit

protocol UIDetailPanelDelegate{
    func cancelImageTapped( _ sender : Any?)
}
class UIDetailPanel : UIView{
    public var delegate : UIDetailPanelDelegate?
    
    public var title : String?{
        didSet{
            lblTitle.text = title
        }
    }
    public var synopsis : String?{
        didSet{
            lblSynopsis.text = synopsis
        }
    }
    public var synopsisContent : String?{
        didSet{
            lblSynopsisContent.text = synopsisContent
        }
    }
    public var year : String?{
        didSet{
            lblYear.text = year
        }
    }
    public var rating : String?{
        didSet{
            lblRating.text = rating
        }
    }
    public var image : UIImage?{
        didSet{
            fetchedImage.image = image
        }
    }
    public var Rateimage : UIImage?{
        didSet{
            ratingImage.image = Rateimage
        }
    }
    public var cancelImage : UIImage?{
        didSet{
            crossImage.image = cancelImage
        }
    }
    
    public var ImageURL : String? {
        didSet{
            self.fetchedImage.fetchUImageFromURL(url: URL(string: ImageURL!)!)
        }
    }
    
    private var lblTitle : UILabel = Helper.defaultParagraph(text: "title", fontSize: 30)
    private var lblSynopsis : UILabel = Helper.defaultLabel(text: "Synopsis", fontSize: 25)
    private var lblSynopsisContent : UILabel = Helper.defaultParagraph(text: "content", fontSize: 20)
    private var lblYear : UILabel = Helper.defaultLabel(text: "year", fontSize: 15)
    private var lblRating : UILabel = Helper.defaultLabel(text: "rating", fontSize: 15)
    private var ratingImage : UIImageView = Helper.defaultImage(tintColor: .systemYellow)
    private var fetchedImage : UIImageView = Helper.defaultImage(tintColor: .clear)
    private var crossImage : UIImageView = Helper.defaultImage(tintColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        
        self.addSubviews(fetchedImage, lblSynopsis, lblSynopsisContent, lblTitle, lblYear, lblRating, ratingImage, crossImage)
        self.crossImage.enableTapGestureRecognizer(target: self, action: #selector(crossImageTapped))
    }
    
    @objc private func crossImageTapped(){
        if self.delegate != nil{
            self.delegate!.cancelImageTapped(self)
        }
    }
    
    private func applyConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            crossImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            crossImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            fetchedImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            fetchedImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            fetchedImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            fetchedImage.heightAnchor.constraint(equalToConstant: 400),
            
            lblTitle.topAnchor.constraint(equalTo: fetchedImage.bottomAnchor, constant: 50),
            lblTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            lblSynopsis.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 20),
            lblSynopsis.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            lblYear.topAnchor.constraint(equalTo: lblSynopsis.bottomAnchor, constant: 20),
            lblYear.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            lblRating.topAnchor.constraint(equalTo: lblSynopsis.bottomAnchor, constant: 20),
            lblRating.leadingAnchor.constraint(equalTo: lblYear.trailingAnchor, constant: 200),
            
            ratingImage.bottomAnchor.constraint(equalTo: lblYear.bottomAnchor),
            ratingImage.trailingAnchor.constraint(equalTo: lblRating.leadingAnchor, constant: -10),
            ratingImage.heightAnchor.constraint(equalToConstant: 20),
            ratingImage.widthAnchor.constraint(equalToConstant: 20),
            
            lblSynopsisContent.topAnchor.constraint(equalTo: lblYear.bottomAnchor),
            lblSynopsisContent.leadingAnchor.constraint(equalTo: lblSynopsis.leadingAnchor),
            lblSynopsisContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lblSynopsisContent.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}
