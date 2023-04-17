//
//  UILogin.swift
//  Serioholic
//
//  Created by english on 2023-03-29.
//

import UIKit

class UIMySearchBar : UISearchBar{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        placeholder = "Search by Title"
    }
    
}
