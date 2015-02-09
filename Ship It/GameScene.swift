//
//  GameScene.swift
//  Ship It
//
//  Created by Mollie on 2/9/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let moonRadius: CGFloat = 500
    
    var screenCenter: CGPoint!
    
    let ship = SKSpriteNode(imageNamed: "Spaceship")
    
    // add gestures up and down to move ship
    func swipedUp(sender:UISwipeGestureRecognizer){
        println("swiped up")
        ship.position.y += 100
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        println("swiped down")
        ship.position.y -= 100
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
        
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        screenCenter = view.center
        
        createMoon()
        
        ship.position = screenCenter
        ship.zRotation = -0.7
        self.addChild(ship)
        
        let health = 100
        
        
        // make sound "pfft"
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
//            var fireBallPath = NSBundle.mainBundle().pathForResource("FireBall", ofType: "sks")
//            
//            let fireBall = NSKeyedUnarchiver.unarchiveObjectWithFile(fireBallPath!) as SKEmitterNode
//            
//            fireBall.particleBirthRate = 10
//            
//            //            let ball = SKShapeNode(circleOfRadius: 20)
//            fireBall.position = location
//            
//            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
//            fireBall.physicsBody = physicsBody
//            
//            physicsBody.affectedByGravity = false
//            
//            self.addChild(fireBall)
//            
//            physicsBody.applyForce(CGVectorMake(500.0, 0.0))
            
            let beam = SKShapeNode(rect: CGRectMake(ship.position.x, ship.position.y, 100, 14))
            beam.fillColor = SKColor(red: 1, green: 0.38, blue: 0.11, alpha: 1)
            beam.strokeColor = SKColor.clearColor()
            let beamPhysics = SKPhysicsBody(rectangleOfSize: CGSizeMake(100, 14))
            beam.physicsBody = beamPhysics
            beamPhysics.affectedByGravity = false
            self.addChild(beam)
            beamPhysics.applyForce(CGVectorMake(500, 0))
            
            // shoot ship beams
            
            // make sound "pew, pew"
            
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
    
        // listen for ship colliding with asteroids
        // subtract 20 health
        
        // listen for beams colliding with asteroids
        // remove asteroid from view
        
    }
    
    func createMoon() {
        let moon = SKShapeNode(ellipseOfSize: CGSizeMake(moonRadius, moonRadius))
        moon.strokeColor = SKColor.clearColor()
        moon.fillColor = SKColor(white: 0.9, alpha: 1.0)
        moon.position = CGPointMake(screenCenter.x, -350)
        moon.xScale = 2.5
        moon.yScale = 2.5
        
        self.addChild(moon)
        
//        var craters: [(CGPoint, CGFloat)] = []
//        
//        for i in 1...8 {
//            
//            let x = CGFloat(arc4random_uniform(360) - 180)
//            let y = CGFloat(arc4random_uniform(360) - 180)
//            let size = CGFloat(arc4random_uniform(50))
//            
//            let crater = (CGPointMake(x, y), size)
//            craters.append(crater)
//            
//        }
        
        let craters: [(CGPoint, CGFloat)] = [
            (CGPointMake(40, 50),50),
            (CGPointMake(180, 100),30),
            (CGPointMake(100, -50),20),
            (CGPointMake(120, -80),10),
            (CGPointMake(-40, -150),10),
            (CGPointMake(-140, -100),45),
            (CGPointMake(-180, -50),38),
            (CGPointMake(-10, -50),20)
        ]

        for (p, s) in craters {

            let crater = SKShapeNode(ellipseOfSize: CGSizeMake(s, s))
            crater.fillColor = SKColor(white: 0.8, alpha: 1.0)
            crater.position = p

            moon.addChild(crater)

        }
        
        let asteroids: [(CGPoint, CGFloat)] = [
            (CGPointMake(118, 142), 45),
            (CGPointMake(100, -83), 33),
            (CGPointMake(126, -55), 39),
            (CGPointMake(100, 38), 13),
            (CGPointMake(-145, -133), 34),
            (CGPointMake(-68, -64), 21),
            (CGPointMake(309, 348), 45),
            (CGPointMake(319, -298), 33),
            (CGPointMake(336, -302), 39),
            (CGPointMake(369, 206), 13),
            (CGPointMake(-264, -371), 34),
            (CGPointMake(-342, -345), 38),
            (CGPointMake(-377, -199), 21),
            (CGPointMake(152, 181), 34),
            (CGPointMake(234, -192), 38),
            (CGPointMake(348, -343), 8),
            (CGPointMake(343, 156), 32),
            (CGPointMake(-169, -151), 29),
            (CGPointMake(-363, -350), 7),
            (CGPointMake(-333, -367), 12),
            (CGPointMake(224, 231), 33),
            (CGPointMake(343, -335), 20),
            (CGPointMake(333, -268), 38),
            (CGPointMake(292, 95), 2),
            (CGPointMake(-267, -345), 21),
            (CGPointMake(-371, -368), 37),
            (CGPointMake(-317, -124), 48),
            (CGPointMake(240, 310), 30),
            (CGPointMake(380, -280), 10),
            (CGPointMake(300, -300), 20),
            (CGPointMake(320, 250), 15),
            (CGPointMake(-240, -250), 50),
            (CGPointMake(-340, -250), 45),
            (CGPointMake(-380, -250), 30),
            (CGPointMake(-210, -350), 20)
        ]
        
        for (p, s) in asteroids {
            
            let asteroid = SKShapeNode(ellipseOfSize: CGSizeMake(s, s))
            asteroid.fillColor = SKColor(red: 0.23, green: 0.11, blue: 0, alpha: 1)
            asteroid.strokeColor = SKColor.clearColor()
            asteroid.position = p
            asteroid.physicsBody = SKPhysicsBody(circleOfRadius: s)
            asteroid.physicsBody?.affectedByGravity = false
            
            moon.addChild(asteroid)
            
        }
        
        let moonRotation = SKAction.rotateByAngle(CGFloat(M_PI), duration: 10)
        
        moon.runAction(SKAction.repeatActionForever(moonRotation))

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        // remove beams from parent after they leave the scene
//        for child in self.children as [SKNode] {
//            
//            
//            if child.position.y < -50 {
//                
//                child.removeFromParent()
//                
//            }
//            
//        }
    }
}
