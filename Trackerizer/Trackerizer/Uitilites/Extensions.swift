//
//  Extensions.swift
//  Trackerizer
//
//  Created by Kishor LD on 20/06/23.
//

import Foundation
import UIKit

extension NSString {
    func validPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

        return passwordValidation.evaluate(with: self)
    }
    
    func containsNumbers() -> Bool {
            do {
                // Define the regular expression pattern to match numbers (0-9)
                let regex = try NSRegularExpression(pattern: "\\d", options: [])
                let matches = regex.matches(in: self as String, options: [], range: NSRange(location: 0, length: self.length))
                
                // If there are any matches, it means numbers are present in the string
                return !matches.isEmpty
            } catch {
                // Handle error if regular expression is invalid
                print("Error creating regular expression: \(error)")
                return false
            }
        }
    func containsUppercaseLetters() -> Bool {
           do {
               // Define the regular expression pattern to match uppercase letters
               let regex = try NSRegularExpression(pattern: "[A-Z]", options: [])
               let matches = regex.matches(in: self as String, options: [], range: NSRange(location: 0, length: self.length))
               
               // If there are any matches, it means uppercase letters are present in the string
               return !matches.isEmpty
           } catch {
               // Handle error if regular expression is invalid
               print("Error creating regular expression: \(error)")
               return false
           }
       }
    
    func containsLowercaseLetters() -> Bool {
           do {
               // Define the regular expression pattern to match uppercase letters
               let regex = try NSRegularExpression(pattern: "[a-z]", options: [])
               let matches = regex.matches(in: self as String, options: [], range: NSRange(location: 0, length: self.length))
               
               // If there are any matches, it means uppercase letters are present in the string
               return !matches.isEmpty
           } catch {
               // Handle error if regular expression is invalid
               print("Error creating regular expression: \(error)")
               return false
           }
       }
    func containsSpecialCharacters() -> Bool {
            do {
                // Define the regular expression pattern to match special characters using the \\W pattern
                let regex = try NSRegularExpression(pattern: "\\W", options: [])
                let matches = regex.matches(in: self as String, options: [], range: NSRange(location: 0, length: self.length))
                
                // If there are any matches, it means special characters are present in the string
                return !matches.isEmpty
            } catch {
                // Handle error if regular expression is invalid
                print("Error creating regular expression: \(error)")
                return false
            }
        }
}

extension String {
    func isValidEmail() -> Bool {
          let emailRegEx = "^(?!\\.)([A-Z0-9a-z_%+-]?[\\.]?[A-Z0-9a-z_%+-])+@[A-Za-z0-9-]{1,20}(\\.[A-Za-z0-9]{1,15}){0,10}\\.[A-Za-z]{2,20}$"
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: self)
     }
    
    func isvalidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

        return passwordValidation.evaluate(with: self)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    func addDashBorder() {
        let color = TrackerizerColorAssests.greyScale30.color.cgColor

            let shapeLayer:CAShapeLayer = CAShapeLayer()

            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

            shapeLayer.bounds = shapeRect
            shapeLayer.name = "DashBorder"
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = color
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = .round
            shapeLayer.lineDashPattern = [4,4]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 20).cgPath

            self.layer.masksToBounds = false

            self.layer.addSublayer(shapeLayer)
        }
}

class CustomTextField: UITextField {
    var onDeleteBackward: (() -> Void)?
    
    override func deleteBackward() {
        super.deleteBackward()
        
        // Call the custom closure when the "back" button is pressed
        onDeleteBackward?()
    }
}

