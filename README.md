https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#code
## App Folder Structure
This is one way of organizing your app structure... another would be to organize it by feature, keeping related code together (high cohesion.)
NOTE: Typically, you would have a Models folder. However, this app uses Core Data.

<img src="https://github.com/Brian-McIntosh/GoalPostApp/blob/main/images/AppStructure.png" width="225">


## Customizing a TableViewCell
<img src="https://github.com/Brian-McIntosh/GoalPostApp/blob/main/images/TableCell.png" width="400">

```swift
class GoalCell: UITableViewCell {
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType // Start w/ static text; Change to GoalType later
        self.goalProgressLabel.text = String(describing: goal.goalProgress)
    }
}
```
