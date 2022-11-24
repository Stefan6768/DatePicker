//
//  ViewController.swift
//  DatePicker
//
//  Created by Stefan Schreiber on 24.11.22.
//

import UIKit

class DatumViewController: UIViewController {
    
    
    @IBOutlet weak var datum: UITextField!
    
    
    @IBOutlet weak var zeit: UITextField!
    
    let datumPicker = UIDatePicker()
    let zeitPicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatumPicker()
        createZeitPicker()
    }
    
    func createDatumPicker(){
        datumPicker.preferredDatePickerStyle = .wheels
        datumPicker.datePickerMode = .date
        datum.inputView = datumPicker
        datum.inputAccessoryView = createDatumToolbar()
    }
    func createZeitPicker() {
        zeitPicker.preferredDatePickerStyle = .wheels
        zeitPicker.datePickerMode = .time
        zeitPicker.locale = Locale(identifier: "de")
        zeit.inputView = zeitPicker
        zeit.inputAccessoryView = createZeitToolbar()
    }
    func createDatumToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datumPressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    func createZeitToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(zeitPressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar

    }
    
    @objc func datumPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        datum.text = dateFormatter.string(from: datumPicker.date)
        self.view.endEditing(true)
    }
    
    @objc func zeitPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        zeit.text = dateFormatter.string(from: zeitPicker.date)
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func craeteAppointment() {}


}

