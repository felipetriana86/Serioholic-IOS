//
//  ViewController.swift
//  Serioholic
//
//  Created by english on 2023-03-29.
/*
 
 Group - Felipe Triana Murcia(2032086) & Jaina Manik(2111628)
 
 
 */

import UIKit

class ViewController: UIViewController {
    
    let searchPanel : UIMySearchBar = UIMySearchBar()
    let bannerPanel : UIBannerPanel = UIBannerPanel()
    let tableViewCell : UIMyTableViewCell = UIMyTableViewCell()
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    let tableView = UITableView()
    var seriesNow : [Series] = []
    var filteredSeries : [Series] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UIMyTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        fetchData()
        initialize()
        applyConstraints()
    }
    
    func fetchData(){
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        MovieAPI.currentListSeries(limit: 180){httpStatusCode, response in
            print(response)
            guard let result = response["results"] as? [[String : Any]]
            else {
                return
            }
            for obj in result {
                let serie = Series.decode(json: obj )
                self.seriesNow.append(serie!)
            }
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.isHidden = true
                self.tableView.reloadData()
            }
            print(">>>HTTP Code from API.Call: \(httpStatusCode)")
        }failHandler: { httpStatusCode, errorMessage in
            print(">>>FailHandler : HTTP Code from API.Call : \(httpStatusCode)")
        }
    }
    
    func initialize() {
        let backgroundImage = UIImage(named: "backimage")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        
        self.view.addSubviews(backgroundImageView, bannerPanel, searchPanel, tableView, tableViewCell, activityIndicatorView)
        self.view.sendSubviewToBack(backgroundImageView)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        searchPanel.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: 40)
        searchPanel.delegate = self
        
        activityIndicatorView.color = .white
        activityIndicatorView.center = view.center
        bannerPanel.logo = UIImage(named: "logo2")
        bannerPanel.bannerTitle = "Hours of fun a click away!"
        
    }
    
    func applyConstraints(){
        self.view.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            bannerPanel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            bannerPanel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bannerPanel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bannerPanel.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: bannerPanel.bottomAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

