//
//  ViewController.swift
//  About_Cats_
//
//  Created by vako on 02.05.24.
//
import UIKit
import MyLibraryAboutCats

class ViewController: UIViewController {
    var tableView: UITableView!
    var viewModel = CatFactsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCatFacts()
    }

    private func setupUI() {
       
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .black
        
       
        self.navigationItem.title = "List of Facts"
        
       
        tableView = UITableView(frame: navigationController.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchCatFacts() {
        viewModel.fetchFacts { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.facts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let fact = viewModel.facts[indexPath.row]
        cell.factLabel.text = fact.fact
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 
    }
}
