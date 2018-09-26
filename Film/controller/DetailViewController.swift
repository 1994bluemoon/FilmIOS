//
//  DetailViewController.swift
//  Film
//
//  Created by Dương Hoàng on 9/23/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imBanner: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imPoster: UIImageView!
    @IBOutlet weak var lbDetail: UILabel!
    @IBOutlet weak var tvContent: UITextView!
    
    var film: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataToView()
        // Do any additional setup after loading the view.
    }
    
    func bindDataToView(){
        if(film?.BackDropPath == ""){
            imBanner.image = UIImage(named: "banner")
        } else{
            imBanner.setImage(from: URL(string: "https://image.tmdb.org/t/p/w500\(film?.BackDropPath ?? "aa")")!, withPlaceholder: imBanner.image)
        }
        imPoster.setImage(from: URL(string: "https://image.tmdb.org/t/p/w500\(film?.LogoPath ?? "defaul")")!, withPlaceholder: imPoster.image)
        lbTitle.text = film?.Title
        tvContent.text = film?.Description
    }

    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func bookTicketClicked(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
