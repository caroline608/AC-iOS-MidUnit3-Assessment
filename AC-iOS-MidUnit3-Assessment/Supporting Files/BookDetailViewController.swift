//
//  BookDetailViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by Keshawn Swanston on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var book: ItemWrapper!
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        titleLabel.text = book.title?.capitalized
        subtitleLabel.text = book.subtitle
        priceLabel.text = String(describing: book.retailPrice?.amount)
        authorLabel.text = String(describing: book.authors)
        summaryTextView.text = book.description
        getImage()
    }
    
    
    func getImage() {
        let apiManager = APIManager()
        apiManager.getData(endPoint: book.imageLinks.thumbnail) { (data: Data?) in
            if let data = data {
                DispatchQueue.main.async {
                    self.bookImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
