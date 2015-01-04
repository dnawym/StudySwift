//
//  TeamCell.swift
//  WorldCup
//
//  Created by Pietro Rea on 8/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

  @IBOutlet weak var teamLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var flagImageView: UIImageView!
  
  @IBAction func addWin(sender: AnyObject) {
    
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    teamLabel.text = nil
    scoreLabel.text = nil
    flagImageView.image = nil
  }
  
}
