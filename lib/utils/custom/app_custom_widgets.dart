// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, dead_code

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constant/dimensions.dart';
import '../constant/images.dart';
import '../themes/colors.dart';
import '../themes/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.actions = const [],
    this.leading = const SizedBox(),
    this.fontWeight = Dime.FONT_WEIGHT_DEFAULT,
  });
  final String title;
  final List<Widget> actions;
  final Widget leading;

  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: actions,
      leading: leading,
      elevation: 0,
      title: Text(
        title,
        style: textStyleLarge(context).copyWith(color: _darkColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool disabled;
  const CustomButton(
      {super.key,
      this.color = CustomColor.primaryColor,
      required this.title,
      required this.onTap,
      this.isLoading = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;

    return GestureDetector(
      onTap: !disabled
          ? onTap
          : () {
              print("Button Disabled!");
            },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.11,
        decoration: BoxDecoration(
          color: isLoading || disabled ? color.withOpacity(0.6) : color,
          borderRadius: BorderRadius.circular(
            Dime.RADIUS_SMALL,
          ),
        ),
        child: Center(
            child: isLoading
                ? SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: _lightColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    title,
                    style: textStyleDefault(context)
                        .copyWith(color: CustomColor.lightColor),
                  )),
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  const CustomField(
      {super.key, required this.controller, this.hint = "", this.icon});

  final TextEditingController controller;
  final String hint;
  final IconData? icon;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: textStyleDefault(context).copyWith(color: _darkColor),
        cursorColor: CustomColor.greyColor,
        cursorWidth: 0.9,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColor.greyColor.withOpacity(0.154),
          hintText: widget.hint,
          hintStyle:
              textStyleDefault(context).copyWith(color: CustomColor.greyColor),
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIconColor:
              // _isFocused ? CustomColor.primaryColor :
              CustomColor.greyColor,
          prefixIcon: Icon(
            widget.icon,
            size: Dime.R_ICON_SIZE(context),
          ),
          focusColor: CustomColor.primaryColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key, required this.controller, this.hint = "", this.icon});

  final TextEditingController controller;
  final String hint;
  final IconData? icon;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _showPassword = false;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: textStyleDefault(context).copyWith(color: _darkColor),
        cursorColor: CustomColor.greyColor,
        cursorWidth: 0.9,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColor.greyColor.withOpacity(0.154),
          hintText: widget.hint,
          hintStyle:
              textStyleDefault(context).copyWith(color: CustomColor.greyColor),
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIconColor:
              // _isFocused ? CustomColor.primaryColor :
              CustomColor.greyColor,
          prefixIcon: Icon(
            widget.icon,
            size: Dime.R_ICON_SIZE(context),
          ),
          focusColor: CustomColor.primaryColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greyColor, width: 2),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              size: Dime.R_ICON_SIZE(context),
              color: CustomColor.greyColor,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}

//hello

class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {super.key,
      required this.title,
      required this.description,
      this.rating = 0,
      this.ratingCount = 0,
      required this.imageUrl});
  final String title;
  final String description;
  final double rating;
  final double ratingCount;
  final String imageUrl;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    final Color _cardColor = Theme.of(context).cardColor;

    ThemeData appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Dime.SCREEN_WIDTH(context) * 0.49,
        decoration: BoxDecoration(
          // border: appTheme.brightness == Brightness.dark ? customBorder : null,
          color: _cardColor,
          borderRadius: BorderRadius.circular(Dime.RADIUS_SMALL),
          boxShadow: [
            appTheme.brightness == Brightness.dark
                ? const BoxShadow()
                : customBoxShadow
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Dime.RADIUS_SMALL)),
                  child: CustomImage(
                    image: widget.imageUrl,
                    height: Dime.SCREEN_WIDTH(context) * 0.2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: Dime.PADDING_SIZE_EXTRA_SMALL,
                    right: Dime.PADDING_SIZE_EXTRA_SMALL,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.all(Dime.PADDING_SIZE_EXTRA_SMALL),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              BorderRadius.circular(Dime.RADIUS_SMALL),
                        ),
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 15,
                          color: _isLiked
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    )),
              ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: Dime.PADDING_SIZE_EXTRA_SMALL,
                    left: Dime.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleDefault(context)
                                .copyWith(color: _darkColor)),
                        Text(
                          widget.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleSmall(context)
                              .copyWith(color: CustomColor.greyColor),
                        ),
                        RatingBar(
                          rating: widget.rating,
                          ratingCount: widget.ratingCount,
                          size: 12,
                        ),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  final bool isNotification;
  final BorderRadius? borderRadius;
  const CustomImage(
      {super.key,
      required this.image,
      this.height = 16,
      this.width = 16,
      this.fit = BoxFit.cover,
      this.isNotification = false,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => Image.asset(Images.placeholder,
            height: height, width: width, fit: fit),
        errorWidget: (context, url, error) => Image.asset(Images.placeholder,
            height: height, width: width, fit: fit),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final double ratingCount;
  const RatingBar(
      {super.key,
      required this.rating,
      required this.ratingCount,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();
    Color startColor = Colors.yellow;

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(Icons.star, color: startColor, size: size));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star, color: startColor, size: size),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        _starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount > 0
        ? _starList.add(Padding(
            padding: const EdgeInsets.only(left: Dime.PADDING_SIZE_EXTRA_SMALL),
            child: Text(
              " $ratingCount",
              style: textStyleSmall(context).copyWith(color: startColor),
            ),
          ))
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;
  _Clipper({required this.part});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.title,
      required this.ratings,
      required this.imageUrl});
  final String title;
  final double ratings;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    ThemeData appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            // border:
            //     appTheme.brightness == Brightness.dark ? customBorder : null,
            borderRadius: BorderRadius.circular(Dime.RADIUS_DEFAULT),
            boxShadow: [
              appTheme.brightness == Brightness.dark
                  ? const BoxShadow()
                  : customBoxShadow,
            ]),
        width: Dime.SCREEN_WIDTH(context) * 0.34,
        height: Dime.SCREEN_WIDTH(context) * 0.34,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dime.RADIUS_DEFAULT),
              child: CustomImage(
                image: imageUrl,
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dime.RADIUS_DEFAULT),
                gradient: LinearGradient(colors: [
                  CustomColor.backColor.withOpacity(0.7),
                  CustomColor.backColor.withOpacity(0.1)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: textStyleLarge(context).copyWith(
                        color: CustomColor.lightColor,
                        fontWeight: Dime.FONT_WEIGHT_LARGE),
                  ),
                  RatingBar(rating: ratings, ratingCount: 0),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "See More",
          style: textStyleDefault(context).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: CustomColor.primaryColor,
              decorationThickness: 2.0,
              color: CustomColor.primaryColor,
              fontWeight: Dime.FONT_WEIGHT_LARGE),
        ),
      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  final bool isSelected;
  const BottomNavItem(
      {super.key, required this.iconData, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          icon: Icon(iconData,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : CustomColor.greyColor.withOpacity(0.6),
              size: 25),
          onPressed: onTap),
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      this.action,
      required this.rating});
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback? action;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: CustomColor.greyColor, width: 0.4),
          ),
        ),
        child: ListTile(
            onTap: action,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Dime.PADDING_SIZE_DEFAULT,
                vertical: Dime.PADDING_SIZE_EXTRA_SMALL),
            title: Text(
              title,
              style: textStyleDefault(context),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: textStyleSmall(context)
                      .copyWith(color: CustomColor.greyColor),
                ),
                RatingBar(
                  rating: rating,
                  ratingCount: 0,
                  size: 13,
                ),
              ],
            ),
            trailing: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.add,
                  color: CustomColor.greyColor,
                ),
                Icon(
                  Icons.favorite_outline,
                  color: CustomColor.greyColor,
                ),
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(Dime.RADIUS_SMALL),
              child: CustomImage(
                image: imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}

class CartTile extends StatefulWidget {
  const CartTile(
      {super.key,
      required this.quantity,
      this.add,
      this.remove,
      required this.title,
      required this.price});
  final int quantity;
  final VoidCallback? add;
  final VoidCallback? remove;
  final String title;
  final double price;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dime.PADDING_SIZE_DEFAULT),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: Dime.SCREEN_WIDTH(context) * 0.3,
          child: Text(
            widget.title,
            style: textStyleDefault(context).copyWith(
              fontWeight: Dime.FONT_WEIGHT_MEDIUM,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            formatPrice(widget.price),
            style: textStyleDefault(context).copyWith(
              color: CustomColor.greyColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          width: Dime.SCREEN_WIDTH(context) * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedIconButton(
                icon: Icons.remove,
                onTap: widget.remove,
                isDisable: widget.quantity <= 0,
              ),
              Text(
                widget.quantity.toString(),
                style: textStyleDefault(context).copyWith(
                  fontWeight: Dime.FONT_WEIGHT_MEDIUM,
                ),
              ),
              RoundedIconButton(
                icon: Icons.add,
                onTap: widget.add,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {super.key,
      required this.icon,
      this.color = CustomColor.primaryColor,
      this.onTap,
      this.isDisable = false});
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return GestureDetector(
      onTap: !isDisable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(2),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDisable ? color.withOpacity(0.5) : color,
        ),
        child: FittedBox(
            child: Icon(
          icon,
          color: _lightColor,
        )),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.items});
  final List<Widget> items;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _index = 0;
  final CarouselController _carouselController = CarouselController();

   final bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    final _items = widget.items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
            carouselController: _carouselController,
            items: widget.items,
            options: CarouselOptions(
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  print(index);
                  _index = index;
                });
              },
            )),
        Row(mainAxisSize: MainAxisSize.min, children: [
          for (int i = 0; i < _items.length; i++)
            SliderDots(
              isSelected: i == _index,
              onTap: () {},
            )
        ]),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class SliderDots extends StatelessWidget {
  const SliderDots({super.key, this.isSelected = false, this.onTap});
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: isSelected ? 30 : 15,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? const Color.fromARGB(255, 115, 115, 115)
              : CustomColor.greyColor,
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return Container(
      margin: const EdgeInsets.all(Dime.PADDING_SIZE_SMALL),
      padding: const EdgeInsets.all(Dime.PADDING_SIZE_LARGE),
      width: Dime.SCREEN_WIDTH(context) * 0.8,
      height: Dime.SCREEN_WIDTH(context) * 0.5,
      decoration: BoxDecoration(
        color: CustomColor.primaryColor,
        borderRadius: BorderRadius.circular(
          Dime.PADDING_SIZE_DEFAULT,
        ),
      ),
      child: Column(children: [
        Text(
          title,
          style: textStyleExtraLarge(context).copyWith(color: _lightColor),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textStyleLarge(context).copyWith(
            color: _lightColor,
          ),
        ),
      ]),
    );
  }
}

class SmallCard extends StatefulWidget {
  const SmallCard({super.key});

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            height: Dime.SCREEN_WIDTH(context) * 0.2,
            width: Dime.SCREEN_WIDTH(context) * 0.2,
            decoration: BoxDecoration(
              color:
                  isSelected ? CustomColor.primaryColor : CustomColor.greyColor,
              borderRadius: BorderRadius.circular(Dime.RADIUS_DEFAULT),
            ),
          ),
        ),
        Text(
          "Wash & Iron",
          style: textStyleDefault(context).copyWith(
            fontWeight: Dime.FONT_WEIGHT_MEDIUM,
          ),
        )
      ],
    );
  }
}

class AlphaProductCard extends StatelessWidget {
  const AlphaProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dime.PADDING_SIZE_DEFAULT),
      padding: const EdgeInsets.all(Dime.PADDING_SIZE_EXTRA_SMALL),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dime.RADIUS_DEFAULT), boxShadow: [
            appTheme.brightness == Brightness.dark
                ? const BoxShadow()
                : customBoxShadow
          ],),
          
      width: Dime.SCREEN_WIDTH(context) * 0.55,
      height: Dime.SCREEN_WIDTH(context) * 0.5,
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          height: Dime.SCREEN_WIDTH(context) * 0.25,
          child: CustomImage(
            borderRadius: BorderRadius.circular(Dime.RADIUS_SMALL),
            image:
                "https://dev.flutter_widgets.lk/storage/services/img/CrQuzUqbYS4kst2vQoTxbdsPQ_1698878794.png",
          ),
        )
      ]),
    );
  }
}
