//  ViewController.swift
//  JonesSpencer_Exercise03
//  Created by Spencer Jones on 3/13/24.

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var editColorButton: UIButton!
    
    // Tuple to store color components
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat)?

    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Update ui if colorCompents is set
        if let colorComponents = colorComponents {
            updateUI(with: colorComponents)
        }
    }

    // Function to update ui with color components
    func updateUI(with components: (red: CGFloat, green: CGFloat, blue: CGFloat)) {
        // Update color view background color
        colorView.backgroundColor = UIColor(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
        
        // Update labels with color component values
        redLabel.text = String("Red: \(components.red)")
        greenLabel.text = String("Green: \(components.green)")
        blueLabel.text = String("Blue: \(components.blue)")
    }

    // Prepare for segue to pass colorComponents to SecondViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController {
            secondVC.colorComponents = colorComponents
        }
    }
    
    // Unwind segue to receive updated colorComponents from SecondViewController
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? SecondViewController, let colorComponents = sourceVC.colorComponents {
            self.colorComponents = colorComponents
                updateUI(with: colorComponents)
                
        }
    }
}
