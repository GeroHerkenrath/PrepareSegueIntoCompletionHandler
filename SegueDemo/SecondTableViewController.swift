//
//  SecondTableViewController.swift
//  SegueDemo
//
//  Created by Gero Herkenrath on 29.06.16.
//
//

import UIKit

class SecondTableViewController: UITableViewController {
	var fromParent : String?
	
	var displayedVals :[String] = []
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		// you probably want to start a loading animation somehow that stops once the request is done
		
		if fromParent != nil {
			
			// When this is called, the prepareForSegue: in FirstTableViewController has already set fromParent.
			// You can then use that to construct your request. I assume it's something like NSURLSession's
			// dataTaskWithRequest:completionHandler: For this example, I defined my own function that works similar:
			// It gets the input for the request (fromParent) and has a completion handler that is called when
			// it has "finished" the fake request. Basically it just returns the input in the completion handler.
			getData(fromParent!, onSuccess: { (result, error) in
				// In this setup the view gets reloaded everytime, so the array starts empty anyways. If that's not the case in your setup,
				// you can reset the array in viewWillDisappear or right before this line
				if result != nil {
					self.displayedVals.append(result!)
				}
				
				// hey, don't forget to stop the loading animation now that you have data. Or display an error if needed
				// In this case here we don't need that, and the table displays the data all on its own anyways
			})
		}
	}
	
	func getData(input:String, onSuccess:(result:String?, error: NSError?) -> Void){
		// instead of doing any request, I immediately call the completion handler... booooring! :)
		onSuccess(result: input, error: nil)
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayedVals.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("secondCell", forIndexPath: indexPath)
		cell.textLabel?.text = displayedVals[indexPath.row]
		return cell
	}
}