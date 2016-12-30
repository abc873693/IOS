//
//  ViewController.swift
//  PockercardDemo
//
//  Created by Ray on 2016/12/29.
//  Copyright © 2016年 kuas. All rights reserved.
//

import UIKit

class PockerCardViewController: UIViewController {
    
    @IBOutlet weak var staticCard: CardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let staticTapRecongnizer = UITapGestureRecognizer(target: self, action: #selector(turnCard(_:)))
        let dynamicCardTapRecongnizer = UITapGestureRecognizer(target: self, action: #selector(turnCard(_:)))
        let staticPanRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(PanCard(_:)))
        let dynamicCardPanRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(PanCard(_:)))
        staticCard.addGestureRecognizer(staticTapRecongnizer)
        staticCard.addGestureRecognizer(staticPanRecongnizer)
        staticCard.turnCard()
        let dynamicCard = CardView(frame: CGRect(x:100,y:50,width:230,height:330))
        self.view.addSubview(dynamicCard)
        dynamicCard.setRank(rank: 13)
        dynamicCard.setSuit(suit: .diamond)
        dynamicCard.addGestureRecognizer(dynamicCardTapRecongnizer)
        dynamicCard.addGestureRecognizer(dynamicCardPanRecongnizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func turnCard(_ sender:UITapGestureRecognizer){
        let view = sender.view as! CardView
        view.turnCard()
    }
    
    func PanCard(_ sender:UIPanGestureRecognizer){
        let view = sender.view as! CardView
        switch sender.state {
        case .changed: fallthrough
        case .ended:
            view.panTo(point: sender.location(in: view.superview))
        default:
            break
        }
    }
    
    
}

