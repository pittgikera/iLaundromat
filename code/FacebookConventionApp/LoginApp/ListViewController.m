//
//  ListViewController.m
//  LoginApp
//
//  Created by ilabafrica on 11/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ListViewController.h"
#import "Events.h"


@interface ListViewController ()

@end

@implementation ListViewController{
    NSArray *event;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Events *eve1=[Events new];
    eve1.name=@"Movie Convention";
    eve1.details=@"Harry Potter Movie Convention. Date: 23-24 October 2016.";
    eve1.image=@"harry.jpg";
    
    Events *eve2=[Events new];
    eve2.name=@"Gaming Convention";
    eve2.details=@"Batman Arkham Nights Gaming Convention. Date: 5-7 November 2016.";
    eve2.image=@"batman.jpg";
    
    Events *eve3=[Events new];
    eve3.name=@"Reading Convention";
    eve3.details=@"Lord of the Rings Book Reading Convention. Date: 19-21 November 2016.";
    eve3.image=@"lord.jpg";
    
    Events *eve4=[Events new];
    eve4.name=@"Map";
    eve4.details=@"Conventions happening on the Map in 2016";
    eve4.image=@"map.jpeg";
    
    
    event=[NSArray arrayWithObjects:eve1,eve2,eve3,eve4, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    return[event count];
    
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"eventItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    Events *lang = ((Events*) event[indexPath.row]);
    cell.textLabel.text =lang.name;
    [cell.detailTextLabel setText:lang.details];
    
    cell.imageView.image = [UIImage imageNamed:lang.image];
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSInteger index = [self.myTableView indexPathForSelectedRow].row;
    
    if([segue.identifier isEqualToString: @"eventIdentifier"]){
        [(PreviewViewController *) segue.destinationViewController setEvents:
         [self objectInListAtIndex: index]];
        
    }}

-(Events *)objectInListAtIndex: (NSInteger) index{
    return [event objectAtIndex: index];
}


@end
