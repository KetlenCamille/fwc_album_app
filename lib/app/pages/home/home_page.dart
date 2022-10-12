import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'widgets/sticker_percent_widget.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
            builder: (_, constrains) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 35),
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/bola.png',
                              fit: BoxFit.cover),
                        ),
                        StickerPercentWidget(
                          percent: user?.totalCompletePercent ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${user?.totalStickers ?? 0} figurinhas',
                          style: context.textStyles.titleWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/all_icon.png'),
                          label: 'All',
                          value: user?.totalAlbum ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/missing_icon.png'),
                          label: 'Missing',
                          value: user?.totalComplete ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/repeated_icon.png'),
                          label: 'Repeated',
                          value: user?.totalDuplicates ?? 0,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Button(
                          label: 'My stickers',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/my-stickers');
                          },
                          width: MediaQuery.of(context).size.width * .9,
                          outline: true,
                          style: context.buttonStyles.yellowOutlineButton,
                          labelStyle: context.textStyles.textSecondaryExtraBold
                              .copyWith(color: context.colors.yellow),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
