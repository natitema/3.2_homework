//
//  ViewController.swift
//  3.2_homework
//
//  Created by Artem Ryabichev on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let service = Service()
    private var articles: [News] = []
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "DataCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        service.getNews(country: "us", category: "sports", limit: "10") { articles in
            self.articles = articles
            self.tableView.reloadData()
        }
        setTable()
        title = "USA Sports Today"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellID)
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        if let title = articles[indexPath.row].title {
            cell.title.text = String(title.prefix(40)) + "..."}
        cell.content.text = articles[indexPath.row].content ?? articles[indexPath.row].description ?? articles[indexPath.row].url
        return cell
    }
}

