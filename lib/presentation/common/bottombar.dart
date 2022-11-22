import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/color.dart';

const Color defaultColor = Colors.white;
const Color defaultOnSelectColor = Colors.white;

class BottomNav extends StatefulWidget {
  final int? index;
  final void Function(int i)? onTap;
  final List<BottomNavItem>? items;
  final double elevation;
  final IconStyle? iconStyle;
  final Color color;
  final LabelStyle? labelStyle;
  BottomNav({super.key, 
    this.index,
    this.onTap,
    this.items,
    this.elevation = 0.0,
    this.iconStyle,
    this.color = Colors.white,
    this.labelStyle,
  })  : assert(items != null),
        assert(items!.length >= 2);
  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  //DashboardController recontroll = Get.put(DashboardController());
  int? currentIndex;
  IconStyle? iconStyle;
  LabelStyle? labelStyle;
  @override
  void initState() {
    currentIndex = widget.index;
    iconStyle = widget.iconStyle ?? IconStyle();
    labelStyle = widget.labelStyle ?? LabelStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor =
        isDarkMode ? AppColors.commenTextColor : AppColors.fbcolor;
    return CustomPaint(
      size: Size(
        size.width,
        80,
      ),
      painter: BNBCustomPainter(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: widget.items!.map((b) {
            final int i = widget.items!.indexOf(b);
            final bool selected = i == widget.index;
            return BMNavItem(
              icon: b.icon,
              iconSize: selected
                  ? iconStyle!.getSelectedSize()
                  : iconStyle!.getSize(),
              label: parseLabel(b.label!, labelStyle!, selected),
              onTap: () => onItemClick(i),
              textStyle: selected
                  ? labelStyle!.getOnSelectTextStyle()
                  : labelStyle!.getTextStyle(),
              color: selected
                  ? iconStyle!.getSelectedColor()
                  : iconStyle!.getColor(),
            );
          }).toList(),
        ),
      ),
    );
  }

  onItemClick(int i) {
    setState(() {
      currentIndex = i;
    });
    if (widget.onTap != null) widget.onTap!(i);
  }

  parseLabel(String label, LabelStyle style, bool selected) {
    if (!style.isVisible()) {
      return null;
    }
    if (style.isShowOnSelect()) {
      return selected ? label : null;
    }
    return label;
  }
}

class BottomNavItem {
  final String? icon;
  final String? label;
  BottomNavItem(this.icon, {this.label});
}

class LabelStyle {
  final bool? visible;
  final bool? showOnSelect;
  final TextStyle? textStyle;
  final TextStyle? onSelectTextStyle;
  LabelStyle(
      {this.visible,
      this.showOnSelect,
      this.textStyle,
      this.onSelectTextStyle});
  isVisible() {
    return visible ?? true;
  }

  isShowOnSelect() {
    return showOnSelect ?? false;
  }

  // getTextStyle returns `textStyle` with default `fontSize` and
  // `color` values if not provided. if `textStyle` is null then
  // returns default text style
  getTextStyle() {
    if (textStyle != null) {
      return TextStyle(
        inherit: textStyle!.inherit,
        color: textStyle!.color ?? defaultOnSelectColor,
        fontSize: textStyle!.fontSize ?? 12.0,
        fontWeight: textStyle!.fontWeight,
        fontStyle: textStyle!.fontStyle,
        letterSpacing: textStyle!.letterSpacing,
        wordSpacing: textStyle!.wordSpacing,
        textBaseline: textStyle!.textBaseline,
        height: textStyle!.height,
        locale: textStyle!.locale,
        foreground: textStyle!.foreground,
        background: textStyle!.background,
        decoration: textStyle!.decoration,
        decorationColor: textStyle!.decorationColor,
        decorationStyle: textStyle!.decorationStyle,
        debugLabel: textStyle!.debugLabel,
        fontFamily: textStyle!.fontFamily,
      );
    }
    return const TextStyle(color: defaultColor, fontSize: 12.0);
  }

  // getOnSelectTextStyle returns `onSelectTextStyle` with
  // default `fontSize` and `color` values if not provided. if
  // `onSelectTextStyle` is null then returns default text style
  getOnSelectTextStyle() {
    if (onSelectTextStyle != null) {
      return TextStyle(
        inherit: onSelectTextStyle!.inherit,
        color: onSelectTextStyle!.color ?? defaultOnSelectColor,
        fontSize: onSelectTextStyle!.fontSize ?? 12.0,
        fontWeight: onSelectTextStyle!.fontWeight,
        fontStyle: onSelectTextStyle!.fontStyle,
        letterSpacing: onSelectTextStyle!.letterSpacing,
        wordSpacing: onSelectTextStyle!.wordSpacing,
        textBaseline: onSelectTextStyle!.textBaseline,
        height: onSelectTextStyle!.height,
        locale: onSelectTextStyle!.locale,
        foreground: onSelectTextStyle!.foreground,
        background: onSelectTextStyle!.background,
        decoration: onSelectTextStyle!.decoration,
        decorationColor: onSelectTextStyle!.decorationColor,
        decorationStyle: onSelectTextStyle!.decorationStyle,
        debugLabel: onSelectTextStyle!.debugLabel,
        fontFamily: onSelectTextStyle!.fontFamily,
      );
    }
    return const TextStyle(color: defaultOnSelectColor, fontSize: 12.0);
  }
}

class IconStyle {
  final double? size;
  final double? onSelectSize;
  final Color? color;
  final Color? onSelectColor;
  IconStyle({this.size, this.onSelectSize, this.color, this.onSelectColor});
  getSize() {
    return size ?? 20.0;
  }

  getSelectedSize() {
    return onSelectSize ?? 20.0;
  }

  getColor() {
    return color ?? defaultColor;
  }

  getSelectedColor() {
    return onSelectColor ?? defaultOnSelectColor;
  }
}

class BMNavItem extends StatelessWidget {
  final String? icon;
  final double? iconSize;
  final String? label;
  final void Function()? onTap;
  final Color? color;
  final TextStyle? textStyle;
  const BMNavItem({super.key, 
    this.icon,
    this.iconSize,
    this.label,
    this.onTap,
    this.color,
    this.textStyle,
  })  : assert(icon != null),
        assert(iconSize != null),
        assert(color != null),
        assert(onTap != null);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkResponse(
      key: key,
      highlightColor: Theme.of(context).highlightColor,
      splashColor: Theme.of(context).splashColor,
      radius: Material.defaultSplashRadius,
      onTap: () => onTap!(),
      child: Padding(
          padding: getPadding(),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            SvgPicture.asset(
              icon!,
              height: iconSize,
              color: color,
              width: iconSize,
            ),
            const SizedBox(
              height: 7,
            ),
            label != null
                ? Container(
                    height: 1.2,
                    width: iconSize! / 0.7,
                    color: color,
                  )
                : Container(height: 1, width: 10, color: Colors.transparent)
            // label != null
            //     ? md.Text(label, style: textStyle)
            //     : md.Container()
          ])),
    ));
  }

  // getPadding returns the padding after adjusting the top and bottom
  // padding based on the fontsize and iconSize.
  getPadding() {
    if (label != null) {
      final double p = ((56) - iconSize!) / 2;
      return EdgeInsets.fromLTRB(0.0, p, 0.0, p);
    }
    return EdgeInsets.fromLTRB(
        0.0, (56 - iconSize!) / 2, 0.0, (56 - iconSize!) / 4);
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF082A4F)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 40); // Start
    path.quadraticBezierTo(size.width * 0.20, 10, size.width * 0.40, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.41, 0);
    path.arcToPoint(Offset(size.width * 0.59, 0),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.6, 0);
    path.quadraticBezierTo(size.width * 0.80, 10, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
