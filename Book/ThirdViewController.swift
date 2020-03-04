//
//  ThirdViewController.swift
//  movie
//
//  Created by bug on 2020/03/03.
//  Copyright © 2020 jiwan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var detailIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    var bookTitle: String?
    var bookPrice: String?
    var bookSubTitle: String?
    var bookImageURL: String?
    
    //test
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.text = bookTitle
        priceLabel.text = bookPrice
        subTitleLabel.text = bookSubTitle
        if let image = bookImageURL {
           let url = URL(string: image)
           URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in 

              if error != nil {
                 print(error!)
                 return
              }

              DispatchQueue.main.async {
                self.bookImageView.image = UIImage(data: data!)
                self.detailIndicator.stopAnimating()
              }
           }).resume()
        }
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
