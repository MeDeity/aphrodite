import 'package:aphrodite/res/styles.dart';
import 'package:aphrodite/utils/common_utils.dart';
import 'package:flutter/material.dart';

///
/// 可点击菜单项
/// create by fengwenhua at 2019-11-7 20:19:09
///
class ClickItem extends StatelessWidget {
  //点击事件
  final GestureTapCallback onTap;

  //左侧ICON
  final Widget leftIcon;

  //标题
  final String title;

  //标题样式
  final TextStyle titleStyle;

  //右侧内容
  final String content;

  //文字对齐方式
  final TextAlign textAlign;

  //内容样式
  final TextStyle contentStyle;

  //内容最大行数
  final int maxLines;

  //背景色
  final Color backgroundColor;

  //边距
  final EdgeInsetsGeometry margin;

  //是否隐藏下划线
  final bool needUnderLine;

  //是否强制隐藏右箭头
  final bool hideArrow;

  //下划线颜色(默认为白色),该属性受needUnderLine影响.如果下划线被隐藏,则该属性无效
  final Color underLineColor;

  const ClickItem(
      {Key key,
      this.onTap,
      this.leftIcon,
      @required this.title,
      this.titleStyle,
      this.content: "",
      this.textAlign: TextAlign.start,
      this.contentStyle: TextStyles.textGray14,
      this.maxLines: 1,
      this.backgroundColor: Colors.white,
      this.needUnderLine: true,
      this.hideArrow: true,
      this.underLineColor: Colors.white,
      this.margin: const EdgeInsets.only(left: 15.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          constraints:
              BoxConstraints(maxHeight: double.infinity, minHeight: 50.0),
          width: double.infinity,
//          decoration: BoxDecoration(
//              border: Border(
//                bottom: Divider.createBorderSide(context, color: Colours.line, width: 0.6),
//              )
//          ),
          child: Row(
            //为了数字类文字居中
            crossAxisAlignment: maxLines == 1
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              Offstage(
                offstage: leftIcon != null ? false : true,
                child: leftIcon,
              ),
              Offstage(
                offstage: leftIcon != null ? false : true,
                child: Gaps.hGap10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: needUnderLine
                      ? BoxDecoration(
                          border: Border(
                          bottom: Divider.createBorderSide(context,
                              color: underLineColor, width: 0.6),
                        ))
                      : null,
                  child: Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: titleStyle,
                      ),
                      Spacer(),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 8.0, left: 16.0),
                          child: Text(
                            content,
                            maxLines: maxLines,
                            textAlign:
                                maxLines == 1 ? TextAlign.right : textAlign,
                            overflow: TextOverflow.ellipsis,
                            style: contentStyle ?? TextStyles.textDark14,
                          ),
                        ),
                      ),
                      Opacity(
                        // 无点击事件时，隐藏箭头图标
                        opacity: (onTap == null || hideArrow) ? 0 : 1,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
                          child: CommonUtils.loadAssetImage(
                            "ic_arrow_right",
                            height: 16.0,
                            width: 16.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
