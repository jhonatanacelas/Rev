//
//  JHOEnviarIpadViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 13/09/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOEnviarIpadViewController.h"
#import "JHOAppDelegate.h" 

@interface JHOEnviarIpadViewController ()

@end

@implementation JHOEnviarIpadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    
    
    if ([[appDelegate.tramiteDiccionario objectForKey:@"perdidaDIN"] integerValue]==0) {
        justificacion.userInteractionEnabled =NO;
    }
    
    
    self.navigationItem.title = @"Envio";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)enviarTramite:(id)sender {
    
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    
    
    
    //NSString *urlArmada = [NSString  stringWithFormat:@"http://localhost/WebService/Tramite.php?ica3101=%@ &nombre_finca=%@&nombre_propietario=%@&cedula_propietario=%@&telefonofijo%@&celular_propietario=%@",ica,nombre_finca,nombre_propietario,cedula_propietario,telefono_fijo_propuetario,celular_propietario];
    
    NSString *justi;
    
    if ([justificacion.text isEqualToString:@""]) {
        justi = [NSString  stringWithFormat:@"sin justi"];
    }else{
        justi= [NSString  stringWithFormat:justificacion.text];
    }
    
    NSString *urlArmada = [NSString  stringWithFormat:@"http://procesagro.tucompualdia.com/crearFormulario/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/",[appDelegate.tramiteDiccionario objectForKey:@"ica"],[appDelegate.tramiteDiccionario objectForKey:@"nombreFinca"],[appDelegate.tramiteDiccionario objectForKey:@"nombrePropietario"],[appDelegate.tramiteDiccionario objectForKey:@"cedulaPropietario"],[appDelegate.tramiteDiccionario objectForKey:@"fijoPropietario"],[appDelegate.tramiteDiccionario objectForKey:@"celularPropietario"],[appDelegate.tramiteDiccionario objectForKey:@"municipio"],[appDelegate.tramiteDiccionario objectForKey:@"departamento"],[appDelegate.tramiteDiccionario objectForKey:@"nombreSolicitante"],[appDelegate.tramiteDiccionario objectForKey:@"cedulaSolicitante"],[appDelegate.tramiteDiccionario objectForKey:@"fijoSolicitante"],[appDelegate.tramiteDiccionario objectForKey:@"celularSolicitante"],[appDelegate.tramiteDiccionario objectForKey:@"menor1Bovinos"],[appDelegate.tramiteDiccionario objectForKey:@"entre12Bovinos"],[appDelegate.tramiteDiccionario objectForKey:@"entre23Bovinos"],[appDelegate.tramiteDiccionario objectForKey:@"mayores3Bovinos"],[appDelegate.tramiteDiccionario objectForKey:@"menor1Bufalino"] ,[appDelegate.tramiteDiccionario objectForKey:@"entre12Bufalino"],[appDelegate.tramiteDiccionario objectForKey:@"entre23Bufalino"],[appDelegate.tramiteDiccionario objectForKey:@"mayor3Bufalino"],[appDelegate.tramiteDiccionario objectForKey:@"primeraVez"],[appDelegate.tramiteDiccionario objectForKey:@"nacimiento"],[appDelegate.tramiteDiccionario objectForKey:@"compra"],[appDelegate.tramiteDiccionario objectForKey:@"perdidaDIN"],justi];
    
    
    
    
    NSLog(@"%@" ,urlArmada);
    
    
    NSLog(@"remplazar espacios por valido");
    NSArray *convertir = [urlArmada componentsSeparatedByString:@" "];
    
    NSLog(@"vector  %@" , convertir);
    
    NSString *nuevaURL = [NSString  stringWithFormat:@""];
    
    for (int i=0; i<[convertir count]; i++) {
        
        if ([nuevaURL length]<=0) {
            nuevaURL = [NSString  stringWithFormat:@"%@",[convertir objectAtIndex:i]];
        }else {
            
            nuevaURL = [NSString  stringWithFormat:@"%@_%@",nuevaURL,[convertir objectAtIndex:i]];
        }
        
    }
    NSLog(@"COnvertida %@",nuevaURL);
    
    NSURL *url = [NSURL URLWithString:nuevaURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
    if ([ret isEqualToString:@"Insertado"]) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Tramite Exitoso" message:@"Su solicitud se ha realizado exitosamente. \n Gracias por utilizar nuestro servicio" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
        // Redirecciona al view controller inicial de la app
        [[self navigationController] dismissModalViewControllerAnimated:YES];
        
    }else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Tramite Fallido" message:@"Su solicitud no se ha realizado . \n Por vafor verifique su conexion" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    

}
@end
