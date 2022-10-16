abstract class StickerDetailView {
  void screenLoaded(bool hasSticker, String countryCode, String stickerNumber,
      String countryName, int amount) {}

  void updateAmount(int amount);
  void showLoader();
  void saveSuccess();
  void error(String message);
}
