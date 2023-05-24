//
//  ExchangeDetailView.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 22/05/23.
//

import UIKit
import SDWebImage

protocol ExchangeDetailViewProtocol: AnyObject {
    func updateUI(with exchange: ExchangeViewModel)
}

class ExchangeDetailView: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var firstQuoteLabel: UILabel!
    @IBOutlet weak var lastQuoteLabel: UILabel!
    @IBOutlet weak var firstTradeLabel: UILabel!
    @IBOutlet weak var lastTradeLabel: UILabel!
    @IBOutlet weak var volume1HrsLabel: UILabel!
    @IBOutlet weak var volume1DayLabel: UILabel!
    @IBOutlet weak var volume1MthLabel: UILabel!
    @IBOutlet weak var siteButton: UIButton!
    
    var presenter: ExchangeDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    private func loadContent() {
        
    }
    
    @IBAction func openSiteButton(_ sender: Any) {
        presenter?.openWebsiteButtonTapped()
    }
}

extension ExchangeDetailView: ExchangeDetailViewProtocol {
    func updateUI(with vm: ExchangeViewModel) {
        if let urlIcon = vm.exchangeIcon?.url, let url = URL(string: urlIcon) {
            self.logoImage.sd_setImage(with: url, completed: nil)
        }

        self.nameLabel.text = vm.exchange.name
        
        let startDate = vm.exchange.dataStart?.toDate(withFormat: DateFormat.yyyyMMdd.rawValue)
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let dateStartStr = formatter1.string(from: startDate!)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "dd/MM/yyyy hh:mm"
        
        self.startDateLabel.text = "Início em: \(dateStartStr)"
        self.firstQuoteLabel.text = "Primeira Cotação: \(formatter2.string(from: (vm.exchange.dataQuoteStart?.toDate())!))"
        self.lastQuoteLabel.text = "Última Cotação: \(formatter2.string(from: (vm.exchange.dataQuoteEnd?.toDate())!))"
        self.firstTradeLabel.text = "Primeira Trade: \(formatter2.string(from: (vm.exchange.dataTradeStart?.toDate())!))"
        self.lastTradeLabel.text = "Última Trade: \(formatter2.string(from: (vm.exchange.dataTradeEnd?.toDate())!))"
        self.volume1HrsLabel.text = "Volume por Hora: $\(vm.exchange.volume1HrsUsd)"
        self.volume1DayLabel.text = "Volume Diário: $\(vm.exchange.volume1DayUsd)"
        self.volume1MthLabel.text = "Volume Mensal: $\(vm.exchange.volume1MthUsd)"
        self.siteButton.setTitle(vm.exchange.website, for: .normal)
    }
}
