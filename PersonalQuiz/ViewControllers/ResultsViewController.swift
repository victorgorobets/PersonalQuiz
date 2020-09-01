//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Избавиться от кнопкп возврата
    // 2. Передать сюда массив с выбранными ответами
    // 3. Определить то животное, которое встречается чаще всего
    // 4. Отобразить результаты
    // 5. Подумать над логикой определени индекса в соответсвии с диапазоном
    
    @IBOutlet weak var resultLabelSmiles: UILabel!
    @IBOutlet weak var resultLabelText: UILabel!
    
    var answersChoosen: [Answer] = []
    
    private var smiles = ""
    private var definition = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        prepareText()
        resultLabelSmiles.text = "Вы - \(smiles)"
        resultLabelText.text = definition
    }
    
    // подсчет животных с максимальным рейтингом
    private func calculateMaxAnimal() -> [AnimalType] {
        var shortArray = [AnimalType : Int] ()
        
        for element in answersChoosen {
            if shortArray[element.type] != nil {
                shortArray[element.type]! += 1
            } else {
                shortArray[element.type] = 1
            }
        }
        shortArray = shortArray.filter( {$1 == shortArray.values.max()} )
        return Array(shortArray.keys)
    }
    
    // Подготовка сообщений в зависимости от кол-ва животных с максим.рейтингом
    private func prepareText() {
        let result = calculateMaxAnimal()
        for i in 0..<result.count {
            smiles += String(result[i].rawValue)
            definition += result[i].definition
        }
    }
    
}
