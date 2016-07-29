//
//  ControllerTests.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 30/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"

@interface ControllerTests : XCTestCase
@property (nonatomic,strong) SimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno del laboratorio
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;

}

- (void)tearDown {
    // Lo destruimos
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void) testThatTextOnLabelIsEqualToTextOnButton{
    // Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    // Comprobamos que etiqueta y boton tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Button and label should have the same text");
    
}

@end
