////
////  ViewController.swift
////  ButtonAnimation
////
////  Created by mac on 2/11/24.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var button: UIButton!
//    var originalButtonText: String?
//    var activityIndicator: UIActivityIndicatorView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Initialize activity indicator
//        activityIndicator = UIActivityIndicatorView(style: .medium)
//        activityIndicator.color = .white
//        activityIndicator.hidesWhenStopped = true
//        // Center the activity indicator within the button
//        activityIndicator.center = CGPoint(x: button.bounds.midX, y: button.bounds.midY)
//        // Add the activity indicator to the button
//        button.addSubview(activityIndicator)
//    }
//
//    @IBAction func buttonTapped(_ sender: UIButton) {
//        // Save the original button text
//        originalButtonText = button.titleLabel?.text
//        // Disable the button to prevent further taps
//        button.setTitle("", for: .normal)
//        button.isEnabled = false
//        // Start the activity indicator animation
//        activityIndicator.startAnimating()
//
//        // Simulate some task (e.g., network call, processing)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            // Re-enable the button
//            self.button.setTitle(self.originalButtonText, for: .normal)
//            self.button.isEnabled = true
//            // Stop the activity indicator animation
//            self.activityIndicator.stopAnimating()
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
//            self.navigationController?.pushViewController(vc!, animated: true)
//        }
//    }
//}


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize loading button
        loadingButton.layer.cornerRadius = 5
    }

    @IBAction func loadingButtonTapped(_ sender: UIButton) {
        // Disable the button to prevent multiple taps
        sender.isEnabled = false

        // Show loading animation
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = CGPoint(x: sender.bounds.midX, y: sender.bounds.midY)
        activityIndicator.startAnimating()
        sender.addSubview(activityIndicator)

        // Simulate loading process (Replace with your actual loading process)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Remove loading animation
            activityIndicator.removeFromSuperview()

            // Enable the button
            sender.isEnabled = true

            // Navigate to the next slide
            self.navigateToNextSlide()
            

        }
    }
    
    func navigateToNextSlide() {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }

    
}




