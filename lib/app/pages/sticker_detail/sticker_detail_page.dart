import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import '../../core/ui/widgets/button.dart';
import 'view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Sticker'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(hasSticker
                ? 'assets/images/sticker.png'
                : 'assets/images/sticker_pb.png'),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '$countryCode $stickerNumber',
                    style: context.textStyles.textPrimaryFontBold
                        .copyWith(fontSize: 22),
                  ),
                ),
                const Spacer(),
                RoundedButton(
                    icon: Icons.remove,
                    onPressed: widget.presenter.decrementAmount),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '$amount',
                    style: context.textStyles.textSecondaryFontMedium,
                  ),
                ),
                RoundedButton(
                    icon: Icons.add,
                    onPressed: widget.presenter.incrementAmount),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                countryName,
                style: context.textStyles.textPrimaryFontRegular,
              ),
            ),
            Button.primary(
              label: hasSticker ? 'Update sticker' : 'Add sticker',
              onPressed: widget.presenter.saveSticker,
              width: MediaQuery.of(context).size.width * .9,
            ),
            Button(
              style: context.buttonStyles.primaryOutlineButton,
              labelStyle: context.textStyles.textSecondaryExtraBoldPrimaryColor,
              label: 'Remove sticker',
              outline: true,
              onPressed: widget.presenter.deleteSticker,
              width: MediaQuery.of(context).size.width * .9,
            )
          ]),
        ),
      ),
    );
  }
}
