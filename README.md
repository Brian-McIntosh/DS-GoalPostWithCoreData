# GoalPostApp
Topics covered:

App Folder Structure
[screenshot]

Customizing a TableViewCell
[screenshot]

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType // change to GoalType later
        self.goalProgressLabel.text = String(describing: goal.goalProgress)
    }
}
