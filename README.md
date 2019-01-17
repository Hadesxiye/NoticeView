# NoticeView
A simple notice view with animation。可用于公告，强制更新，各种提示等。
当前基础版本，自己修改控件配色奥~
Usage:
```
NoticeView* noticeView = [NoticeView noticeViewInitTo:<#(nonnull UIView *)#>];
[noticeView show];
[noticeView hide];
```
Mode:
```
noticeView.mode = noticeViewMode_NoneButton;
```
![noticeViewMode_NoneButton](https://github.com/Hadesxiye/NoticeView/blob/master/gif/01.gif)
---
```
noticeView.mode = noticeViewMode_OneButton;
```
![noticeViewMode_OneButton](https://github.com/Hadesxiye/NoticeView/blob/master/gif/02.gif)
---
```
noticeView.mode = noticeViewMode_TwoButton;
```
![noticeViewMode_TwoButton](https://github.com/Hadesxiye/NoticeView/blob/master/gif/03.gif)
---
In detail:
See Example
