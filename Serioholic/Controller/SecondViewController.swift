//
//  SecondViewController.swift
//  Serioholic
//
//  Created by English on 2023-04-01.
//

import UIKit

class SecondViewController: UIViewController, UIDetailPanelDelegate{
    
    let detailPanel : UIDetailPanel = UIDetailPanel()
    var seriesDisplayed : Series?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        applyConstraints()
    }
    
    private func initialize(){
        let backgroundImage = UIImage(named: "backimage")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        
        self.view.addSubviews(detailPanel, backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
        detailPanel.delegate = self
        detailPanel.ImageURL = seriesDisplayed?.img
        detailPanel.synopsisContent = seriesDisplayed?.synopsis
        detailPanel.rating = seriesDisplayed?.rating
        detailPanel.Rateimage = UIImage(systemName: "star.fill")
        detailPanel.cancelImage = UIImage(systemName: "xmark")
        detailPanel.year = seriesDisplayed?.year
        detailPanel.title = seriesDisplayed?.title
    }
    
    private func applyConstraints(){
        self.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailPanel.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailPanel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailPanel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            detailPanel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    func cancelImageTapped( _ sender : Any?) {
        // detailPanel.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
}



