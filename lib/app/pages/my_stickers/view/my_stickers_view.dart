import '../../../models/groups_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupsStickers> album);
  void error(String message);
  void updateStatusFilter(status);
  void updatedAlbum(List<GroupsStickers> album);
  void showLoader();
}
