//
//  ViewController.swift
//  EDUtilitiesDemo
//
//  Created by Edwin Wilson on 22/02/2021.
//

import UIKit
import EDDevUtilities

class ViewController: UIViewController {

    private enum Constants {

        static let cellIdentifier = "FeatureCell"
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    private func configureTableView() {

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Features.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        )

        cell.textLabel?.text = Features.allCases[safe: indexPath.row]?.rawValue
        return cell
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let feature = Features.allCases[safe: indexPath.row] else { return }

        switch feature {
        case .route:
            routeFeatureDemo()
        case .DemoView:
            do {
                let view: DemoView  = try DemoView.fromNib()
                view.frame = CGRect(origin: CGPoint(x: 50, y: 50),
                                    size: CGSize(width: 200, height: 200)
                )
                self.view.addSubview(view)
            } catch {
                print("Error \(error)")
            }
        }
    }
}

