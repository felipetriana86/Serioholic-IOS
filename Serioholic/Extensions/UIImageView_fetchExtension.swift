//
//  fetchExtension.swift
//  Serioholic
//
//  Created by english on 2023-03-31.
//

import UIKit

extension UIImageView {
    
    func fetchUImageFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
