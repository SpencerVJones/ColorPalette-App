//  SecondViewController.swift
//  JonesSpencer_Exercise03
//  Created by Spencer Jones on 3/13/24.

import UIKit

class SecondViewController: UIViewController {
    
    // Outlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var randomizeButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
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
        
        // Update sliders with color component values
        redSlider.value = Float(components.red)
        greenSlider.value = Float(components.green)
        blueSlider.value = Float(components.blue)
    }
    
    // Action triggereed when slider value changes
    @IBAction func colorSliderChanged(_ sender: UISlider) {
        // Store the updated values of sliders
        var updatedRed = redSlider.value
        var updatedGreen = greenSlider.value
        var updatedBlue = blueSlider.value
                
        // Check which slider triggered the action and update that color component
        if sender == redSlider {
            updatedRed = sender.value
        } else if sender == greenSlider {
            updatedGreen = sender.value
        } else if sender == blueSlider {
            updatedBlue = sender.value
        }
                
        // Update color components with updated slider values
        colorComponents = (red: CGFloat(updatedRed), green: CGFloat(updatedGreen), blue: CGFloat(updatedBlue))
                    
        // Update ui with the new color components
        updateUI(with: colorComponents!)
    }
        
    // Action triggered when randomize button is pressed
    @IBAction func randomizeColor(_ sender: UIButton) {
        // Generate random values between 0 and 1 for color components
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
        // Update color components with random values
        colorComponents = (red: randomRed, green: randomGreen, blue: randomBlue)
        
        // Update ui with the new color components
        updateUI(with: colorComponents!)
            
    }
}
