//
//  BookTableViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by Keshawn Swanston on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BookTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var books = [ItemWrapper]()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "bookinfo", ofType: "json") else {
            return
        }
        let myURL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: myURL) else { return }
        let myDecoder = JSONDecoder()
        do {
            let items = try myDecoder.decode(Book.self, from: data)
            self.books = items.items
        }
        catch let error {
            print(error)
        }
    }
    
    //    MARK: - Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "$\(String(describing: book.retailPrice?.amount))"
        return cell
    }

    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedBook = self.books[selectedRow]
            destination.book = selectedBook
        }
    }
 

}
