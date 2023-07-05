//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Андрей Блинов on 23.06.2023.
//
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var pictureResultLabel: UILabel!
    @IBOutlet var textResulrLabel: UILabel!
    
    var resultAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        pictureResultLabel.text = "Вы - \(maxCountOfPet().0.rawValue)"
        textResulrLabel.text = "Вы - \(maxCountOfPet().1)!"
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
    
    private func maxCountOfPet() -> (Animal, String) {
        var cat = 0
        var dog = 0
        var rabbit = 0
        var turtle = 0
        for answer in resultAnswers {
            switch answer.animal {
                case .dog: dog += 1
                case .cat: cat += 1
                case .rabbit: rabbit += 1
                case .turtle: turtle += 1
            }
        }
        let maximum = max(cat, dog, rabbit, turtle)
        if cat == maximum {
            return (.cat,"Кот")
        } else if  dog == maximum {
            return (.dog, "Собака")
        } else if rabbit == maximum {
            return (.rabbit, "Кролик")
        } else {
            return (.turtle, "Черепаха")
        }
    }
    
}
