//
//  CreateGoalVC.swift
//  GoalPostApp
//
//  Created by Brian McIntosh on 12/21/22.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: UIButton) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {
                return
            }
            
            // init the data
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            //presentDetail(finishGoalVC)
            //presentSecondaryDetail(finishGoalVC)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        //dismiss(animated: true, completion: nil)
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = .black
    }
}
