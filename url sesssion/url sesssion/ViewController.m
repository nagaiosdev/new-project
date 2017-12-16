//
//  ViewController.m
//  url sesssion
//
//  Created by nagaraj on 10/12/17.
//  Copyright © 2017 nagaraj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labe=[[UILabel alloc]init];
    labe.frame=CGRectMake(10, 100, 200, 100);
    labe.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labe];

    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://api.androidhive.info/contacts/"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
//             NSLog(@"The data is - %@",data);
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@",responseDictionary);
            
            
            
//            NSString *str=[NSString stringWithFormat:@"%@",[[[[responseDictionary objectForKey:@"contacts"] objectAtIndex:0] objectForKey:@"phone"] objectForKey:@"mobile"]] ;
            
//            labe.text=str;
            
            
//            NSLog(@"The value  is - %@",str);
        }
        else
        {
            NSLog(@"Error");     
        }
    }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
