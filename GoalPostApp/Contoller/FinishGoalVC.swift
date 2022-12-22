//
//  FinishGoalVC.swift
//  GoalPostApp
//
//  Created by Brian McIntosh on 12/21/22.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    var goaldescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
         
    }
    
    func initData(description: String, type: GoalType) {
        self.goaldescription = description
        self.goalType = type
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        // Pass data into the Core Data Goal Model
        if pointsTextField.text != "" {
            self.save(completion: { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goaldescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("success")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
