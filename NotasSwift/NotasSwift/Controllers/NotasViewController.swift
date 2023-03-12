//
//  NotasViewController.swift
//  NotasSwift
//
//  Created by Jose on 09/03/23.
//

import UIKit

class NotasViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var items:[Nota] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegarte = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegarte.persistentContainer.newBackgroundContext()
        context.perform {
            do {
                let notas = try context.fetch(ManagedNota.fetchRequest())
                self.items = notas.map { Nota(message: $0.message ?? "", date: $0.date ?? Date()) }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                
            }
        }
    }
    
}

extension NotasViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        if items.isEmpty {
            let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
            label.textAlignment = .center
            label.text = "No hay elementos"
            collectionView.backgroundView = label
            return 0
        } else {
            collectionView.backgroundView = nil
            return 1
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotaCollectionViewCell", for: indexPath) as! NotaCollectionViewCell
        let nota = items[indexPath.row]
        print("nota.message = \(nota.message)")
        cell.setup(message: nota.message, date: nota.date)
        return cell
    }
}
