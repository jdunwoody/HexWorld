//
// Created by James Dunwoody on 17/03/15.
// Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import UIKit

class BirdDetailsDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    let flock: Flock

    init(flock: Flock) {
        self.flock = flock
        super.init()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flock.size
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BirdDetailsCell", forIndexPath: indexPath) as UITableViewCell

        let birdDetailTableCell = cell as BirdDetailTableCell

        birdDetailTableCell.nameLabel!.text = flock[indexPath.row].name
//        birdDetailTableCell.weightLabel!.text = "\(flock[indexPath.row].weight)"
//        let label = cell.viewWithTag(100) as UILabel
//        let switchControl = cell.viewWithTag(101) as UISwitch
//
//        label.text = setting.name
//        switchControl.selected = setting.enabled

        return birdDetailTableCell
    }

}
