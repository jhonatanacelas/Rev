            //
//  JHODatosSolicitanteViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosSolicitanteViewController : UIViewController{
    
    IBOutlet UITextField *nombreSolicitante;
    IBOutlet UITextField *cedulaSolicitante;
    IBOutlet UITextField *fijoSolicitante;
    IBOutlet UITextField *celularSolicitante;
    
}

@property  (nonatomic,strong) IBOutlet UITextField *nombreSolicitante;

- (IBAction)salirnombresol:(id)sender;
- (IBAction)salirCedSol:(id)sender;
- (IBAction)salirFijoSol:(id)sender;
- (IBAction)salirCelSol:(id)sender;

@end
