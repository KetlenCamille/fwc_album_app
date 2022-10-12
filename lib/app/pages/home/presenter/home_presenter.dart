import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';

abstract class HomePresenter extends FwcPresenter {
  Future<void> getUserData();
  Future<void> logout();
}
