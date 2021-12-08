//
//  ViewController.swift
//  XuConnieHW4
//
//  Created by Connie Xu on 9/29/21.
//

import UIKit

class ViewController: UIViewController {

    //1ST VIEW OUTLETS
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var taxSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var includeTaxSwitch: UISwitch!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    //2ND VIEW OUTLETS
    @IBOutlet weak var finalTaxLabel: UILabel!
    
    @IBOutlet weak var finalSubtotalLabel: UILabel!
    
    @IBOutlet weak var finalTipLabel: UILabel!
    
    @IBOutlet weak var finalTotalWithTipLabel: UILabel!
    
    @IBOutlet weak var finalTotalPerPersonLabel: UILabel!
    
    //IB OUTLETS FOR SANITY TEST
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var tipCalculatorLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var taxSegmentLabel: UILabel!
    @IBOutlet weak var includeTaxLabel: UILabel!
    @IBOutlet weak var evenSplitLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var tipViewLabel: UILabel!
    @IBOutlet weak var totalWithTipLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var calcView: UIView!
    
    //VARS
    var tax: Double!
    var subtotal: Double!
    var tipPercent: Double!
    var tip: Double!
    var totalWithTip: Double!
    var totalPerPerson: Double!
    var numSplit: Int!
    var includeTax: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
        setDefaultValues()
        
        //SANITY TEST
        billTextField.accessibilityIdentifier = HW4AccessibilityIdentifiers.billTextField
        taxSegmentedControl.accessibilityIdentifier = HW4AccessibilityIdentifiers.segmentedTax
        includeTaxSwitch.accessibilityIdentifier = HW4AccessibilityIdentifiers.includeTaxSwitch
        tipSlider.accessibilityIdentifier = HW4AccessibilityIdentifiers.tipSlider
        splitStepper.accessibilityIdentifier = HW4AccessibilityIdentifiers.splitStepper
        resetButton.accessibilityIdentifier = HW4AccessibilityIdentifiers.resetButton
        
        finalTaxLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.taxAmountLabel
        finalSubtotalLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.subtotalAmountLabel
        finalTipLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.tipAmountLabel
        finalTotalWithTipLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.totalWithTipAmountLabel
        finalTotalPerPersonLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.totalPerPersonAmountLabel
        tipLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.sliderLabel
        splitLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.splitLabel
        
        tipCalculatorLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.tipCalculaterLabel
        billLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.billLabel
        taxSegmentLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.segmentedLabel
        includeTaxLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.includeTaxLabel
        evenSplitLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.evenSplitLabel
        taxLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.taxLabel
        subtotalLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.subtotalLabel
        tipViewLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.tipLabel
        totalWithTipLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.totalWithTipLabel
        totalPerPersonLabel.accessibilityIdentifier = HW4AccessibilityIdentifiers.totalPerPersonLabel
        
        calcView.accessibilityIdentifier = HW4AccessibilityIdentifiers.view
        
    }
    
    //FUNCTIONS
    func setDefaultValues() {
        tax = 0.08
        subtotal = 0.0
        tipPercent = 0.15
        tip = 0.0
        totalWithTip = 0.0
        totalPerPerson = 0.0
        numSplit = 1
        includeTax = false
    }
    
    func updateUI() {
        var billText = billTextField.text
        
        //testing to see if optional is empty
//        if let bt = billText {
//            print("ill text: " + bt)
//        }
        
        if billText!.isEmpty {
            billText = "0"
        }
        
        let bill = Double(billText!)
        
        let taxSegmentedIndex = self.taxSegmentedControl.selectedSegmentIndex
        var taxPercent: Double = 0.0
        if taxSegmentedIndex == 0 {
            taxPercent = 7.5
        }
        else if taxSegmentedIndex == 1 {
            taxPercent = 8
        }
        else if taxSegmentedIndex == 2 {
            taxPercent = 8.5
        }
        else if taxSegmentedIndex == 3 {
            taxPercent = 9
        }
        else if taxSegmentedIndex == 4 {
            taxPercent = 9.5
        }
        
        tax = ((Double(taxPercent) * 0.01) * bill!)
        self.finalTaxLabel.text = "$\(String(format: "%.2f", tax!))"
        
        if(includeTax) {
            subtotal = bill! + tax
        }
        else {
            subtotal = bill!
        }
        self.finalSubtotalLabel.text = "$\(String(format: "%.2f", subtotal!))"
        
        tip = tipPercent * subtotal!
        self.finalTipLabel.text = "$\(String(format: "%.2f", tip!))"
        
        //testing to see if optional is empty
//        if let it = includeTax {
//            print("include tax: " + it)
//        }
        
//        if (includeTax) {
//            totalWithTip = subtotal! + tip!
//        }
//        else {
//            totalWithTip = tax! + subtotal! + tip!
//        }
//
//        self.finalTotalWithTipLabel.text = "$\(String(format: "%.2f", totalWithTip!))"
//
//        let splitTotal = Double(splitLabel.text!)
//        totalPerPerson = totalWithTip!/splitTotal!
//        self.finalTotalPerPersonLabel.text = "$\(String(format: "%.2f", totalPerPerson!))"
//    }
        var includeForm
        var form
        var formSin
        
        if (includeForm) {
            totalWithTip = form! + tip!
        }
        else {
            totalWithTip = form
        }
        
        self.finalTotalWithTipLabel.text = "$\(String(format: "%.2f", totalWithTip!))"
        
        let splitTotal = Double(splitLabel.text!)
        totalPerPerson = totalWithTip!/splitTotal!
        self.finalTotalPerPersonLabel.text = "$\(String(format: "%.2f", totalPerPerson!))"
    }
    
    func displayAlertController() {
        let alertController = UIAlertController(title: "Clear All Values", message: "Are you sure you want to clear all values?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let clearAll = UIAlertAction(title: "Clear All", style: .destructive) { action in
            self.clearAll()
        }
        //clearAll.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(cancel)
        alertController.addAction(clearAll)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func clearAll() {
        billTextField.text = ""
        taxSegmentedControl.selectedSegmentIndex = 1
        tipSlider.setValue(15, animated: true)
        self.tipLabel.text = "15%"
        splitStepper.value = 1
        splitLabel.text = "1"
        updateUI()
    }
    
    //ACTIONS
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        updateUI()
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        includeTax = !includeTax
        updateUI()
        
    }
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        let tipInt = Int(sender.value)
        self.tipLabel.text = "\(tipInt)%"
        tipPercent = Double(tipInt) * 0.01
        updateUI()
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        let splitInt = Int(sender.value)
        self.splitLabel.text = "\(splitInt)"
        updateUI()
    }
    
    @IBAction func clearAllDidTapped(_ sender: UIButton) {
        displayAlertController()
    }
    
    @IBAction func backgroundDidTapped(_ sender: UIButton) {
        self.billTextField.resignFirstResponder()
        updateUI()
    }
    
}


