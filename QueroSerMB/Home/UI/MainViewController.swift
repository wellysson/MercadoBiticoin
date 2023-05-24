//
//  ViewController.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 17/05/23.
//

import UIKit
//import OHHTTPStubs

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var exchanges: [Exchange]?
    private var exchangesIcons: [ExchangeIcon]?
    let coin = CoinAPI.shared
    
    private var homeRepository: HomeRepositoryProtocol?
    
//    init(homeRepository: HomeRepositoryProtocol = HomeRepository()) {
//        super.init(nibName: nil, bundle: nil)
//        self.homeRepository = homeRepository
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.homeRepository == nil {
            self.homeRepository = HomeRepository()
        }
        self.tableView.accessibilityIdentifier = "exchangeTableView"
        self.configureTableView()
        self.loadExchanges()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.register(UINib.init(nibName: String(describing: ExchangeViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ExchangeViewCell.self))
    }
    private func reloadComplet() {
        if self.exchangesIcons != nil && self.exchanges != nil {
            ProgressHud.shared.hide()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func loadExchanges() {
        ProgressHud.shared.show()
        self.homeRepository?.getExchanges(complete: { [weak self] (exchanges, error) in
            guard let self = self else { return }
            self.exchanges = exchanges
            if let error = error {
                self.showAlert(error: error)
                print(error.localizedDescription)
            } else {
                print(exchanges.first?.dataOrderbookStart?.toDate(withFormat: DateFormat.yyyyMMddTHHmmSSSZ.rawValue))
            }
            self.reloadComplet()
        })
        
        self.homeRepository?.getExchangesIcons(complete: { [weak self] (icons, error) in
            guard let self = self else { return }
            self.exchangesIcons = icons
            if let error = error {
                self.showAlert(error: error)
                print(error.localizedDescription)
            } else {
                print(icons.first?.url)
            }
            self.reloadComplet()
        })
    }
    
    private func showAlert(error: Error) {
        var errorMessage: String?
        if error is CustomError {
            errorMessage = (error as? CustomError)?.errorDescription
        }

        // create the alert
        let alert = UIAlertController(title: "Ops", message: errorMessage, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        DispatchQueue.main.async {
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExchangeViewCell.self), for: indexPath) as? ExchangeViewCell, let exchanges = self.exchanges, let exchangesIcons = self.exchangesIcons {
            let exchange = exchanges[indexPath.row]
            let icon = exchangesIcons.first(where: {$0.exchangeID == exchange.exchangeID})
            _cell.setup(name: exchange.name, id: exchange.exchangeID, volume: exchange.volume1DayUsd, urlImage: icon?.url ?? "")
            return _cell
        }
        
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exchanges?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let exchanges = self.exchanges, let exchangesIcons = self.exchangesIcons {
            let exchange = exchanges[indexPath.row]
            let icon = exchangesIcons.first(where: {$0.exchangeID == exchange.exchangeID})
            print("Exchange: \(exchange.name) icon: \(icon?.url ?? "")")
            
            let exchangeDetailCoordinator = ExchangeDetailCoordinator(navigationController: self.navigationController)
            exchangeDetailCoordinator.start(exchange: exchange, exchangeIcon: icon)
        }
    }
}
