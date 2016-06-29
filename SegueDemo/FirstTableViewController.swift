//
//  ViewController.swift
//  SegueDemo
//
//  Created by Gero Herkenrath on 29.06.16.
//
//

import UIKit

class FirstTableViewController: UITableViewController {

	var genreArray = ["Drama","Classic,Comic/Graphic novel","Crime/Detective","Fable,Fairy tale","Fantasy","Fiction narrative", "Fiction in verse"]
	
	// boring table stuff...
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return genreArray.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		cell.textLabel?.text = genreArray[indexPath.row]
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// note I don't perform any segue myself here, that's done in IB already!
		// If you MUST perform manually, simply uncomment the next two lines (and set up differently in IB). That's basically the same then.
//		let cell = tableView.cellForRowAtIndexPath(indexPath)
//		self.performSegueWithIdentifier("toSecondTable", sender: cell)
	}
	
	// here is the fun!
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		// since it was the table that initiated the segue (set up in IB) I know that the relevant cell is the sender!
		let tappedCell = sender as! UITableViewCell
		let neededInfo = tappedCell.textLabel?.text
		
		let targetVC = segue.destinationViewController as! SecondTableViewController
		
		// if need be, set up the second table VC further, this is just an example
		targetVC.fromParent = neededInfo!
	}
}

