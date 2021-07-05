import 'package:newsapp/DataModels/LiveData.dart';

List<LiveTamil> getLiveChannel() {
  // ignore: deprecated_member_use
  List<LiveTamil> live = <LiveTamil>[];
  LiveTamil liveClass = new LiveTamil();

  liveClass.liveNewsName = "PuthiyaThalaimurai";
  liveClass.liveUrl = "JddGlT64N2s";
  liveClass.imgUrl =
      "https://www.medianews4u.com/wp-content/uploads/2020/04/Puthiya-thalaimurai.jpg";
  live.add(liveClass);

  liveClass = new LiveTamil();
  liveClass.liveNewsName = "NDTV News";
  liveClass.imgUrl =
      "https://live-tv-channels.org/pt-data/uploads/logo/in-ndtv-24x7-8501.jpg";
  liveClass.liveUrl = "yKMT5aJl7yI";
  live.add(liveClass);

  liveClass = new LiveTamil();
  liveClass.liveNewsName = "India Tv";
  liveClass.imgUrl =
      "https://smartdigitalnews.com/wp-content/uploads/2020/04/IndiaTv.png";
  liveClass.liveUrl = "EZy0RAxG8OI";
  live.add(liveClass);

  liveClass = new LiveTamil();
  liveClass.liveNewsName = "ABN Telugu";
  liveClass.imgUrl =
      "https://play-lh.googleusercontent.com/s8mcTrvu2csHX9vyVpB8rO41suuVfs-eyC4Hsgw4UiJiWmCzmvhO8ogTELuy94agK3DJ";
  liveClass.liveUrl = "wc3Y6vI-poI";
  live.add(liveClass);

  liveClass = new LiveTamil();
  liveClass.liveNewsName = "Asiant News";
  liveClass.imgUrl =
      "https://static.asianetnews.com/v1/images/malayalam-live-tv.jpg";
  liveClass.liveUrl = "aoBO8k2ti8c";
  live.add(liveClass);

  liveClass = new LiveTamil();
  liveClass.liveNewsName = "TV9 Kanada";
  liveClass.imgUrl = "https://i.ytimg.com/vi/Q6QR4979KIQ/maxresdefault.jpg";
  liveClass.liveUrl = "KjVno5SSwog";
  live.add(liveClass);
  return live;
}

// yKMT5aJl7yI POlimer
// EZy0RAxG8OI news18
// JddGlT64N2s PuthiyaThalaimurai
// wc3Y6vI-poI Thanthi tv
// aoBO8k2ti8c Jaya plus
// KjVno5SSwog kalaingar news

// English
// WB-y7_ymPJ4 NDTV 24x7
// heFq-5rmUTY India Today
// 47wyhCZ9U4k Republic 24x7

// Hindi
// k9MyH_YJp-0 India TV
// cnX9fQEq59A AajTak
// YGf8JJZM_Yg News24
// mv821NzCqj0 ZEE Hindustan

// Telugu
// Q6QR4979KIQ TV9 Telugu
// HUiHKse-YgM NTV Telugu
// bl9VaUaI0r0 V6 News Telugu
// JIIK4WzXnAw etv telangana
// lyRusqvbZMc TV5 Telugu
// IKj_cj51_W0 ABN Telugu
// kR5vs49ppkI ETV Andra Pradesh

// Malayalam
// jjH6v95z3Nw Manorama
// zcrUCvBD16k 24 News
// d1iwUB9YFnA Mediaone News
// JstrU2QnMY0 Asianet News

// Kanada
// jdJoOhqCipA TV9 Kanada
// GM91zl1Dn4o Suvarna
// xOhoFmuhmQ4 News18 Kanada