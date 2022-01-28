import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class ThumbnailContentList extends StatelessWidget {
  const ThumbnailContentList(
      {Key? key, required this.mobileBody, this.tabletBody, this.desktopBody})
      : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        if (dimensions.maxWidth < kTabletBreakPoint) {
          // 모바일 Widget을 리턴
          return mobileBody;
        } else if (dimensions.maxWidth >= kTabletBreakPoint &&
            dimensions.maxWidth < kDesktopBreakPoint) {
          // 태블릿 Widget을 리턴
          return tabletBody ?? mobileBody; // tablet위젯이 null 이라면 모바일 Widget을 리턴
        } else {
          // DesktopWidget을 리턴
          return desktopBody ??
              mobileBody; // desktop 위젯이 null 이라면 모바일 Widget을 리턴
        }
      },
    );
  }
}
