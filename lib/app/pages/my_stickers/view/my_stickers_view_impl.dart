import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fwc_album_app/app/pages/my_stickers/widgets/sticker_group.dart';

import '../../../core/ui/helpers/loader.dart';
import './my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickersView {
  var album = <GroupsStickers>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) {
    showError(message);
  }

  @override
  void loadedPage(List<GroupsStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
      countries = {for (var c in album) c.countryCode: c.countryName};
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      this.statusFilter = status;
    });
  }

  @override
  void updatedAlbum(List<GroupsStickers> album) {
    hideLoader();
    this.album = album;
  }
}
