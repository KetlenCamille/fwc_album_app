import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;
  const StickerStatusFilter({super.key, required this.filterSelected});

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('all');
            },
            style: filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'all'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'All',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('missing');
            },
            style: filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'missing'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Missing',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('repeated');
            },
            style: filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repeated',
          ),
        ],
      ),
    );
  }
}
