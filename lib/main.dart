import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/services/fwc_album_app.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(FwcAlbumApp());
}
