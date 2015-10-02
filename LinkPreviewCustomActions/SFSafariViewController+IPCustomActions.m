//
//  SFSafariViewController+IPCustomActions.m
//  Instapaper
//
//  Created by Brian Donohue on 10/1/15.
//
//

#import "SFSafariViewController+IPCustomActions.h"

@implementation SFSafariViewController (IPCustomActions)

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    if (![self.delegate respondsToSelector:@selector(url)]) {
        return @[];
    }
    
    NSURL *url = [self.delegate performSelector:@selector(url)];
    UIPreviewAction *saveAction = [UIPreviewAction actionWithTitle:NSLocalizedString(@"Save", nil)
                                                             style:UIPreviewActionStyleDefault
                                                           handler:^(UIPreviewAction *action, UIViewController *previewViewController) {
                                                               NSLog(@"Save: %@", url);
                                                           }];
    UIPreviewAction *openAction = [UIPreviewAction actionWithTitle:NSLocalizedString(@"Open", nil)
                                                             style:UIPreviewActionStyleDefault
                                                           handler:^(UIPreviewAction *action, UIViewController *previewViewController) {
                                                               [[UIApplication sharedApplication] openURL:url];
                                                           }];
    UIPreviewAction *copyAction = [UIPreviewAction actionWithTitle:NSLocalizedString(@"Copy", nil)
                                                             style:UIPreviewActionStyleDefault
                                                           handler:^(UIPreviewAction *action, UIViewController *previewViewController) {
                                                               [UIPasteboard generalPasteboard].string = url.absoluteString;
                                                           }];
    return @[saveAction, openAction, copyAction];
}

@end
