//
//  MyScene.m
//  SKActionSecuenciaAleatoria
//
//  Created by Sergio on 20/02/14.
//  Copyright (c) 2014 Sergio. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKAction *escalar = [SKAction sequence:@[
                                                 [SKAction scaleTo:2 duration:0.5],
                                                 [SKAction scaleTo:1 duration:0.5]
                                                 ]];
        SKAction *parada = [SKAction waitForDuration:1];
        
        NSArray *secuencia = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil];
        
        NSMutableArray * animaciones = [[NSMutableArray alloc] initWithCapacity:4];
        
        SKSpriteNode * boton1 = [[SKSpriteNode alloc] initWithImageNamed:@"parteRoja.png"];
        boton1.position = CGPointMake(CGRectGetMidX(self.frame)-50, CGRectGetMidY(self.frame)+50);
        boton1.name = @"1";
        
        SKSpriteNode * boton2 = [[SKSpriteNode alloc] initWithImageNamed:@"parteAzul.png"];
        boton2.position = CGPointMake(CGRectGetMidX(self.frame)+50, CGRectGetMidY(self.frame)+50);
        boton2.name = @"2";
        
        SKSpriteNode * boton3 = [[SKSpriteNode alloc] initWithImageNamed:@"parteMorada.png"];
        boton3.position = CGPointMake(CGRectGetMidX(self.frame)-50, CGRectGetMidY(self.frame)-50);
        boton3.name = @"3";
        
        SKSpriteNode * boton4 = [[SKSpriteNode alloc] initWithImageNamed:@"parteVerde.png"];
        boton4.position = CGPointMake(CGRectGetMidX(self.frame)+50, CGRectGetMidY(self.frame)-50);
        boton4.name = @"4";

        [self addChild:boton1];
        [self addChild:boton2];
        [self addChild:boton3];
        [self addChild:boton4];
        
        for(NSString * boton in secuencia){
            SKAction * animacion = [SKAction runAction:escalar onChildWithName:boton];
            
            [animaciones addObject:animacion];
            [animaciones addObject:parada];
        }
        
        SKAction *ejecutaTodo = [SKAction sequence:animaciones];
        
        [self runAction:ejecutaTodo];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
