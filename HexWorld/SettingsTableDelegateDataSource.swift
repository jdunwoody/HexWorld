//
//  SettingsTableDelegateDataSource.swift
//  HexWorld
//
//  Created by James Dunwoody on 8/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import UIKit

class SettingsTableDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    let settings: Settings

    override init() {
        settings = Settings()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.size()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("switchCell", forIndexPath: indexPath) as UITableViewCell

        let setting = settings[indexPath.row]

        let label = cell.viewWithTag(100) as UILabel
        let switchControl = cell.viewWithTag(101) as UISwitch

        label.text = setting.name
        switchControl.selected = setting.enabled

        return cell
    }
}
