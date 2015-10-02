# LinkPreviewCustomActions

In iOS 9, `UIWebView` and `WKWebView` can support 3D touches on links to preview the linked URL with `SFSafariViewController` by setting the `allowsLinkPreview` to `YES` on the web view. However, there isn't currently a way to provide a set of custom actions to `SFSafariViewController` and, as such, the `UIPreviewActionItem` list is always "Open", "Add to Reading List", and "Copy".

This project is a proof-of-concept to provide custom `UIPreviewActionItem`s to link previews using `SFSafariViewController`. The approach is somewhat convoluted because the hooks for previewing the link are within the web views, and the developer is never given hooks to provide their own data. The solution is to create a category on `SFSafariViewController`, override `- (NSArray<id<UIPreviewActionItem>> *)previewActionItems` instance method, and pull the URL from the `SFSafariViewController`'s delegate. The `SFSafariViewControllerDelegate` is an instance of `DDURLPreviewAction`, which responds to `@selector(url)`. The code is written in such a way to not use private APIs, and fail gracefully should the internal workings change in a future release.

Here's a screenshot of the result:

![screenshot](/screenshot.jpeg "")

