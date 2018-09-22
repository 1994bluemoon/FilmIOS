//
//  ItemFilmTableViewCell.swift
//  Film
//
//  Created by Dương Hoàng on 9/22/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class ItemFilmTableViewCell: UITableViewCell {

    @IBOutlet weak var lbDes: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imLogo: UIImageView!
    
    var film: Film?{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        self.lbTitle.text = film?.Description
        self.lbDes.text = film?.Title
        let placeholder: UIImage? = nil
        self.imLogo.setImage(from : URL(string: "https://image.tmdb.org/t/p/w50\(film?.LogoPath ?? "aa")")!, withPlaceholder: placeholder)
    }

}

    extension UIImageView {
        func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
            self.image = placeholder
            URLSession.shared.dataTask(with: url) {  (data, _, _) in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
                }.resume()
        }
    }

