//
//  SecondViewController.swift
//  movie
//
//  Created by bug on 2020/03/03.
//  Copyright © 2020 jiwan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var tableViewIndicator: UIActivityIndicatorView!
    let cellIdentifier: String = "bookCell"
    var books: [Book] = []
    var bookName: String?
    var bookResponse: BookResponse?
    var check: Int = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.booksTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let book: Book = self.books[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.booksTableView.delegate = self
        self.booksTableView.dataSource = self
    }
    
    
    // MARK: -ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://api.itbook.store/1.0/search/\(bookName!)") else {return}
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let bookResponse: BookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
                
                //self.books = bookResponse.books
                if self.check != bookResponse.books.count {
                    for i in 0 ..< bookResponse.books.count {
                        self.books.append(bookResponse.books[i])
                        self.check += 1
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableViewIndicator.stopAnimating()
                    self.booksTableView.reloadData()
                }
                
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else {return}
        
        let cell = sender as! UITableViewCell
        let indexPath = booksTableView.indexPath(for: cell)
        nextViewController.bookTitle = books[(indexPath?.row)!].title//내가누른 cell의 text
        nextViewController.bookPrice = books[(indexPath?.row)!].price//내가누른 cell의 row값
        nextViewController.bookSubTitle = books[(indexPath?.row)!].subtitle
        nextViewController.bookImageURL = books[(indexPath?.row)!].image
        
        
    }
    
    
    
}
