//
//  RegisterNotaViewController.swift
//  NotasSwift
//
//  Created by Jose on 09/03/23.
//

import UIKit

class RegisterNotaViewController: UIViewController {

    @IBOutlet weak var notaTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSave(_ sender: Any) {
        let date = Date.now
        let message = notaTextView.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.persistentContainer.performBackgroundTask { context in
            let note = ManagedNota(context: context)
            note.message = message
            note.date = date
            do {
                try context.save()
                DispatchQueue.main.async {
                    self.notaTextView.text = ""
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
