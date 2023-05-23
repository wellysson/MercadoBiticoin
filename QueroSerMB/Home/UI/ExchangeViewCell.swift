//
//  ExchangeViewCell.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 21/05/23.
//

import UIKit
import SDWebImage

class ExchangeViewCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(name: String, id: String, volume: Double, urlImage: String) {
        self.nameLabel.text = name
        self.idLabel.text = "id: \(id)"
        self.volumeLabel.text = "Volume diário USD: \(volume)"
        
        guard let url = URL(string: urlImage) else { return }
        self.iconImage.sd_setImage(with: url, completed: nil)
    }
    
    override func prepareForReuse() {
        self.iconImage.image = nil
        self.nameLabel.text = nil
        self.idLabel.text = nil
        self.volumeLabel.text = nil
    }
}
