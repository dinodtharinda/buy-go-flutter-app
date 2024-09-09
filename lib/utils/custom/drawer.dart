import 'package:flutter/material.dart';
// import 'app_custom_widgets.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String imageURL =
        "https://lh5.googleusercontent.com/-WGo0fR72VKQ/AAAAAAAAAAI/AAAAAAAAANw/QrcxkVdIHto/photo.jpg";
    final scrollController = ScrollController();
    return Drawer(child: LayoutBuilder(
      builder: (context, constraint) {
        return RawScrollbar(
          thumbVisibility: false,
          timeToFade: const Duration(seconds: 1),
          fadeDuration: const Duration(milliseconds: 700),
          thumbColor: Theme.of(context).primaryColorDark,
          thickness: 6,
          radius: const Radius.circular(10),
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(imageURL),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("hello",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                              const Text(
                                "hi there!",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // const AppDivider(),
              
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
