//
//  CardView.swift
//  PockercardDemo
//
//  Created by Ray on 2016/12/29.
//  Copyright © 2016年 kuas. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    enum Suit{
        case club,diamond,heart,spade
    }
    
    //@IBInspectable
    var suit: Suit = .spade
    @IBInspectable
    var rank: Int = 1
    @IBInspectable
    var faceUp: Bool = false
    @IBInspectable
    var backImage:UIImage?
    @IBInspectable
    var cardRect: CGRect?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if faceUp {
            let roundRectPath = UIBezierPath(roundedRect:cardRect!,cornerRadius:10.0)
            roundRectPath.stroke()
            switch suit {
            case .spade:
                let text = NSAttributedString(string: "♠️")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:5))
                //text.draw(at: CGPoint(x:bounds.midX-25,y:bounds.midY-25))
                //text.draw(at: CGRect(x:100,y:100,width:50,height:50))
                let image = UIImage(named:"001")
                image?.draw(in: CGRect(x:bounds.midX-25,y:bounds.midY-25,width:20,height:20))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-30))
                break
            case .diamond:
                let text = NSAttributedString(string: "♦️")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:5))
                //text.draw(at: CGPoint(x:bounds.midX-25,y:bounds.midY-25))
                let image = UIImage(named:"002")
                image?.draw(in: CGRect(x:bounds.midX-25,y:bounds.midY-25,width:20,height:20))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-30))
                break
            case .club:
                let text = NSAttributedString(string: "♣️")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:5))
                let image = UIImage(named:"003")
                image?.draw(in: CGRect(x:bounds.midX-25,y:bounds.midY-25,width:20,height:20))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-30))
                break
            case .heart:
                let text = NSAttributedString(string: "♥️")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:5))
                //text.draw(at: CGPoint(x:bounds.midX-25,y:bounds.midY-25))
                let image = UIImage(named:"004")
                image?.draw(in: CGRect(x:bounds.midX-25,y:bounds.midY-25,width:20,height:20))

                text.draw(at: CGPoint(x:5,y:bounds.size.height-30))
                break
            }
            switch rank {
            case 1:
                let text = NSAttributedString(string: "A")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:35))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-60))
                break
            case 11:
                let text = NSAttributedString(string: "J")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:35))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-60))
                break
            case 12:
                let text = NSAttributedString(string: "Q")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:35))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-60))
                break
            case 13:
                let text = NSAttributedString(string: "K")
                text.draw(at: CGPoint(x:bounds.size.width-30,y:35))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-60))
                break
            default:
                let text = NSAttributedString(string: String(rank) )
                text.draw(at: CGPoint(x:bounds.size.width-30,y:35))
                text.draw(at: CGPoint(x:5,y:bounds.size.height-60))
                break
            }
        }else{
            backImage!.draw(in:cardRect!)
        }
    }
    
    func setup() -> Void {
        backImage = UIImage(named:"001")
        cardRect = bounds
        faceUp = true
        self.backgroundColor = UIColor.white
    }
    
    func setBigColor(color: UIColor) -> Void {
        self.backgroundColor = color
    }
    
    func setRank(rank:Int) -> Void {
        self.rank = rank
        self.setNeedsDisplay()
    }
    
    func setSuit(suit:Suit) -> Void {
        self.suit = suit
        self.setNeedsDisplay()
    }
    
    func turnCard(){
        faceUp = !faceUp
        self.setNeedsDisplay()
    }
    
    func panTo(point:CGPoint){
        frame = CGRect(x: point.x-125, y: point.y-165, width: cardRect!.width, height: cardRect!.height)
    }
}
