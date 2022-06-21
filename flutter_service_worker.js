'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "793be19e5cd8b6c2aa8528aad64fff27",
"index.html": "cdf4101863d82a5a2a803e9a6f38423b",
"/": "cdf4101863d82a5a2a803e9a6f38423b",
"main.dart.js": "329af46154720a39dda9224f85f366dc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "86c55a0c9fafcce673e7f4a9ffa94ea0",
"assets/AssetManifest.json": "664fa4cb64304d76d133208759477bb9",
"assets/NOTICES": "2b537cd223c7813b19e9403d01b71705",
"assets/FontManifest.json": "a30b5895667fc76c1b1819b7b2c681c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/flutter_vector_icons/fonts/Fontisto.ttf": "b49ae8ab2dbccb02c4d11caaacf09eab",
"assets/packages/flutter_vector_icons/fonts/Octicons.ttf": "8e7f807ef943bff1f6d3c2c6e0f3769e",
"assets/packages/flutter_vector_icons/fonts/Feather.ttf": "e766963327e0a89f9ec2ba88646b6177",
"assets/packages/flutter_vector_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Brands.ttf": "13685372945d816a2b474fc082fd9aaa",
"assets/packages/flutter_vector_icons/fonts/MaterialCommunityIcons.ttf": "6a2ddad1092a0a1c326b6d0e738e682b",
"assets/packages/flutter_vector_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_vector_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_vector_icons/fonts/Ionicons.ttf": "b3263095df30cb7db78c613e73f9499a",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Solid.ttf": "1ab236ed440ee51810c56bd16628aef0",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Regular.ttf": "db78b9359171f24936b16d84f63af378",
"assets/packages/flutter_vector_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_vector_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/flutter_vector_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_vector_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_vector_icons/fonts/MaterialIcons.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/packages/popup_shape/assets/images/1.jpeg": "c7fb833c0320f2e8bf576c093b5b5c07",
"assets/packages/popup_shape/assets/images/6.jpeg": "11e3d6197c38fe707538b3605c7139d8",
"assets/packages/popup_shape/assets/images/7.jpeg": "fc347a027b0d1bd24006e49fbe15fcfd",
"assets/packages/popup_shape/assets/images/8.jpeg": "995c147f08e0d6e5c9f24d1dfd5dfe66",
"assets/packages/popup_shape/assets/images/4.jpeg": "34066b15a8404e92c2a4f855673dfc8d",
"assets/packages/popup_shape/assets/images/5.jpeg": "8141b02c031a5005f5ffc2c5a48dbf35",
"assets/packages/popup_shape/assets/images/2.jpeg": "a09876e52c3b8c9d7761d9b3c9202dc8",
"assets/packages/popup_shape/assets/images/3.jpeg": "b9267b03bd7fafb49719c644def22466",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/images/t1.png": "76c20347a513e188b546a756259be0ce",
"assets/assets/images/news.png": "95209c7e3e410f06cd94bb4c759a6d4e",
"assets/assets/images/profileAdsBanner.png": "101623c6057dc514e795794ab619c796",
"assets/assets/images/t2.png": "07befbba8c14b5e5df93080034a42850",
"assets/assets/images/l4.png": "41a9bb422bba4668959ce5a3d2a8e959",
"assets/assets/images/l5.png": "46fa146db5d554085c65ac813e547c78",
"assets/assets/images/t3.png": "53c36d44245d086507d1b373a1f8fd5d",
"assets/assets/images/t7.png": "896d7fe8d1715308e2a9fe508fa792e1",
"assets/assets/images/t10.png": "a1a3508636386ea890d4ed3a3d348e4a",
"assets/assets/images/l1.png": "5b36994570b5fface25a15caace4c469",
"assets/assets/images/t6.png": "2247a2669f1c0200c56c4ddad3aae2d1",
"assets/assets/images/t4.png": "8bc65eb01ef94fc972b94749ecf37518",
"assets/assets/images/l2.png": "2591142b8d9b92937fadbc39cf2a86b0",
"assets/assets/images/l3.png": "be57d138dd4c35a27091286a4c418581",
"assets/assets/images/t5.png": "656259b59cd582774d6dda861073c07c",
"assets/assets/images/round.png": "f398026ae24ba9201767813cec52a362",
"assets/assets/images/slider1.png": "aa4d32623a4a9f039fe4f449a8990d07",
"assets/assets/images/slider2.png": "91f7dffe989f1d46cabd2d07eeec9b14",
"assets/assets/images/winter.png": "8e079c058599ebe69d8240057e290a71",
"assets/assets/images/circle.png": "8b85727a475496804cfdf1aeb403b350",
"assets/assets/images/public.png": "1e44979f2cad8dff493ba2f558e8fe03",
"assets/assets/images/couple_bg.png": "2e9fd04440df800ecf95720fb5f564d8",
"assets/assets/images/Background.png": "3572dfec0b1c067a8d757e11904eb2c6",
"assets/assets/images/p3.png": "bf695010af7f4fd2eaa6f990240a5290",
"assets/assets/images/E2.png": "43607a628a2825082dc8d36c67720b74",
"assets/assets/images/alone_girl.png": "3c78817882dfb51b9ed32202e2d4b591",
"assets/assets/images/news1.png": "f29692893c25656e96544e0b059f7ce5",
"assets/assets/images/avatar.png": "fb1b4cd8950c24faee16c35233b75521",
"assets/assets/images/p2.png": "39b8f4eb30aded0aa26492d3578dd30e",
"assets/assets/images/E1.png": "d8b36fffe44ebbdcdbd0027932e4dc75",
"assets/assets/images/profileConnectionBanner.png": "a6907dec51acdd72ac32f89eb5c4347b",
"assets/assets/images/nasa.png": "b1a711af7c304238615cce4d82185cb4",
"assets/assets/images/news2.png": "344369948d15dd8de9e4ef13e98bc260",
"assets/assets/images/p1.png": "48ab1bb9c8a03a8e0d79293857ab3352",
"assets/assets/images/p5.png": "aca3b8b81a1968473ed477546084404e",
"assets/assets/images/hilton_logo.png": "fb1befba4fda0ceaacd57ec96d1fddf3",
"assets/assets/images/twitter.png": "686bae9f5e21679681db4d3ac0c3d6f8",
"assets/assets/images/p4.png": "7e4437cebe351731f9f5fd7c5ce0d849",
"assets/assets/images/share.png": "520205cd6fee5ea0c05b2039f495bd9c",
"assets/assets/images/profile.png": "e726998baf1278d6fd601e84617bd18f",
"assets/assets/images/companyBanner.png": "7387fc5a2e5345dbf5513992bf34c8f8",
"assets/assets/images/t8.png": "6437a5ab12962cf437a3560a3c350c95",
"assets/assets/images/profile4.png": "87a380bb601cac46629472f3f5c14fcf",
"assets/assets/images/people2.png": "fb54122495d56154ff5262d30ad72307",
"assets/assets/images/videoThumbnail.png": "d015f9ed6e0e95a1af84780f9c6845c4",
"assets/assets/images/t9.png": "a1a3508636386ea890d4ed3a3d348e4a",
"assets/assets/images/round2.png": "3d72c80f25c26dcaf53cfa7c019d57de",
"assets/assets/images/profile2.png": "21e88aec567ed00962d3468f2d063451",
"assets/assets/images/fairmont_logo.png": "0997a125f4403c0df428c14716df4285",
"assets/assets/images/BannerImage.png": "2ec4e487b30a7fb06d6549407ec2645c",
"assets/assets/images/badge.png": "d6651b15f67d6646fc2bc8378d88e673",
"assets/assets/images/profile3.png": "0c8bc4b92ada46e15ebcb74fa13adf22",
"assets/assets/icons/svg/googleplus.svg": "1d568e40c94e3e9a0a0f6e5eabd67804",
"assets/assets/icons/svg/linkdin.png": "babbb01f49b10fd338636a6cd42183af",
"assets/assets/icons/svg/facebook.svg": "e954177e710c8c47c5e434f903bc5f0f",
"assets/assets/icons/svg/twitter.svg": "86bdf643ab8163474de90ad0ed94f766",
"assets/assets/icons/svg/linkdin.svg": "e33e0f00032db0f41bd2b896ab746fe6",
"assets/assets/icons/svg/any.svg": "ba2dac09ba5d59667113806c9d33e578",
"assets/assets/icons/info.png": "350181c77137da7cad96ecfc809c3831",
"assets/assets/icons/invot.png": "3e4eba51a3ddcfea3e0012222d01449b",
"assets/assets/icons/play_whole.png": "9f8516419c5114207f73301dcc5885fc",
"assets/assets/icons/shield.png": "ebb51141b15678a80d5f47d5140fdea7",
"assets/assets/icons/cloudwhite.svg": "a7e43ab7bc00e8a397e6c6812f214a3b",
"assets/assets/icons/x.png": "831395a9dd0fe15f14d2931ae0dce650",
"assets/assets/icons/lock.png": "3b3b89fa7bd4ed8a69a96dd4dc2e37b7",
"assets/assets/icons/invot1.png": "94742ca9582cd80bc83461c499ff0358",
"assets/assets/icons/fb.png": "43f42d20e02f56a82d14bd4a55428abe",
"assets/assets/icons/gp.png": "90c94c3a37f7a02adfd63de344dbaab4",
"assets/assets/icons/like.png": "5998b913a9e7d623416997538c8af7f7",
"assets/assets/icons/logo1.png": "7feb263bf2f3e13038104ce427ba2617",
"assets/assets/icons/menu.png": "da73da9e7e3ee89f8e92bd65b369c74a",
"assets/assets/icons/linkdin.png": "a5636cbb561561219891a593683c6d0a",
"assets/assets/icons/logo.png": "fed4945c3a75c1bbb93ac84b4b178d7c",
"assets/assets/icons/cloud.png": "b2bcb2d12099ecaedaec74c51dcbbae0",
"assets/assets/icons/twitter.png": "228535ca2f0675cec8cd333cb81bd052",
"assets/assets/icons/comment.png": "704f896edaf0d5f25a0f475298782e57",
"assets/assets/icons/share.png": "443efcbe3070f32a2dc9f5032b6f24f6",
"assets/assets/icons/mobileLogo.png": "cad512f2b256efccf9c127be7672629c",
"assets/assets/icons/play_arrow.svg": "feba05a2ce257b1c1a847d23101a66ae",
"assets/assets/icons/right.png": "9c931367a0dec9e3cc950ecb3e98b00b",
"assets/assets/icons/rightShield.png": "04bc1682c4132ed426e1611a145038d5",
"assets/assets/svgicons/earth.svg": "4be3dc1ccc25c6aa32f15ed97ec1a4ff",
"assets/assets/svgicons/checkbox-marked.svg": "163e539cd9a4a0e5bd375261bc2065d9",
"assets/assets/svgicons/information.svg": "64a8c62370455906d6e2f76b5a3b8ffa",
"assets/assets/svgicons/thumb-up.svg": "461eae97b409e4c105271ae26eabebae",
"assets/assets/svgicons/account-multiple.svg": "af5e7066aac0c04edd576cdd21f0d8aa",
"assets/assets/svgicons/plus-box.svg": "a4a4270fdc3e9e04f6cdcc9f7cde8aac",
"assets/assets/svgicons/gmail.svg": "6392011a09f59cd9ffa96720f8444349",
"assets/assets/svgicons/account-plus.svg": "63b2da18e5982d78298a00b281611133",
"assets/assets/svgicons/chevron-down.svg": "9618acbad97552dde49effc12edc3ac6",
"assets/assets/svgicons/briefcase.svg": "d66438895d4a835c3bbe91ddb189c6ed",
"assets/assets/svgicons/outlook.svg": "f2940c4dacdc5f73097a7994d70d00b7",
"assets/assets/svgicons/menuDown.svg": "b4e3598ac3c73cdd50791add6227fdd1",
"assets/assets/svgicons/account-cirlce.svg": "ae7ba13b4921ea974712bf98b817ed84",
"assets/assets/svgicons/map.svg": "8d6b238b0ef14d6e8fe784573291e63f",
"assets/assets/svgicons/account-group.svg": "cf4fad92bfaaf6480b423753f43e745e",
"assets/assets/svgicons/chart-timeline-variant.svg": "8d0f051f0911e0864d8861466428abb5",
"assets/assets/svgicons/card-account-phone.svg": "ec855f2bb565274abd385828ebc7586f",
"assets/assets/svgicons/lock-outline.svg": "fb7161b153500bb79182b3b425e74002",
"assets/assets/svgicons/chevron-up.svg": "ae2d39c58c574ed14622e84c8e3f2849",
"assets/assets/svgicons/map-marker.svg": "5bd608d31d0222411d3a920b2c67cbb6",
"assets/assets/svgicons/lock.svg": "408de8f183f93772abbaa1b8d2a97e85",
"assets/assets/svgicons/chevron-right.svg": "1b52588f947ddb9020b06d6458ad2b64",
"assets/assets/svgicons/swap-horizontal.svg": "99c69abaa4f74c646a367a56058ec728",
"assets/assets/svgicons/instagram.svg": "051ce2cee56379ca1a572fc0fb8a516d",
"assets/assets/svgicons/link.svg": "f46a4306ed764a69b9501362f6e2bd46",
"assets/assets/svgicons/marker-check.svg": "34d2f256970b0e881adc0f800105521d",
"assets/assets/svgicons/key.svg": "95e977f147552a2dfedd1e6509fb7d21",
"assets/assets/svgicons/arrow-right.svg": "700c00f3ae987ee892d4c8b495a94bd7",
"assets/assets/svgicons/format-text-variant.svg": "25b5fc0d4f5da7e2ecba7e9ebe7e1e48",
"assets/assets/svgicons/menu-left.svg": "846af3dd395bd954804fe5eb319847e9",
"assets/assets/svgicons/format-quote-open.svg": "d5361860fe15fb60c8d4e24552f744ad",
"assets/assets/svgicons/school.svg": "a9d14284c0696885b03c48f8540ce1c0",
"assets/assets/svgicons/shield.svg": "170a7554b834808c4fa01084d387dec4",
"assets/assets/svgicons/download.svg": "4512a5027a60854a814d06251243c4cf",
"assets/assets/svgicons/message-reply-text.svg": "1367fb90e0dd33b89570defe36ebf226",
"assets/assets/svgicons/account-box.svg": "862c22765c7de42fbe362c50b828c72d",
"assets/assets/svgicons/plaxo.svg": "4022f7bb5d40c829d6159f8d0246ef7e",
"assets/assets/svgicons/flag.svg": "5e0da53f9cf41382ce89f0e6ce23c74a",
"assets/assets/svgicons/eye-off.svg": "02641f5f95216f354908fea584f500d2",
"assets/assets/svgicons/forum.svg": "101ba9eff22d4277eebe2f0a3463886a",
"assets/assets/svgicons/plus.svg": "f2afb4a75d0f41ba6e12909d19fd4976",
"assets/assets/svgicons/check.svg": "7439fb1a03462cf95d044c5c0432eeac",
"assets/assets/svgicons/warning.svg": "7b2ebbf89aa2d73056889260b3dcf43c",
"assets/assets/svgicons/email.svg": "0fd40c23f278c0e7e02241bade1dcc33",
"assets/assets/svgicons/domain.svg": "03db90865df3f31030f29c30974e7a53",
"assets/assets/svgicons/close.svg": "cd9ea898ce207d36cfe646bd1d4dbbab",
"assets/assets/svgicons/shield-half.svg": "bf66023fa155144be125e8f622478ee7",
"assets/assets/svgicons/email-open.svg": "47d5181732fe28991c3d44f2c8e397ba",
"assets/assets/svgicons/check-circle.svg": "fb01c2166eac29164b0abcab0fab2da0",
"assets/assets/svgicons/heart-outline.svg": "4c2bf81a4c06a17901aa2dd6e93dec5a",
"assets/assets/svgicons/arrow-right-bold.svg": "d90ce08afeb566d48dbb30435cb05383",
"assets/assets/svgicons/play.svg": "c66f09573fb40f130d80ca6c83255c87",
"assets/assets/svgicons/emailbook.svg": "28dbfcfa7f6fc3094fd6be7bc106e107",
"assets/assets/svgicons/facebook.svg": "d853798eb16247fb45cbb5c4f7e6c52c",
"assets/assets/svgicons/camera.svg": "30e6fbaf58b7a4805a0c22607e0f568e",
"assets/assets/svgicons/pinterest.svg": "a1e0210e48c8d2c1e8e58b53ac668c36",
"assets/assets/svgicons/whatsapp.svg": "1fd64ce939f62dff2cc3651ad9732fc7",
"assets/assets/svgicons/arrow-all.svg": "b58cc8e1d247a17cef55d884cc157c98",
"assets/assets/svgicons/cellphone.svg": "0d1a9d70e6b86ea70477ad228291cb6e",
"assets/assets/svgicons/magnify.svg": "2667d58ba91bee98c5625331930a4f67",
"assets/assets/svgicons/xing.svg": "2d92f1763466782489c638267c4999d4",
"assets/assets/svgicons/menu-right.svg": "684267b82d128d43fbee21be0231df61",
"assets/assets/svgicons/youtube.svg": "2145f90d76ccb3f7b1196f730487dee3",
"assets/assets/svgicons/spinner.svg": "6589ebe130f99129f13758e6009cfd0d",
"assets/assets/svgicons/yahoo.svg": "cb887a47ee06dccd3d83ee5b98489133",
"assets/assets/svgicons/pencil.svg": "6a19d2f9aaf83f6af456ef9c6e153140",
"assets/assets/svgicons/delete.svg": "4297c08f0ac06197ca07bc96e2ca6103",
"assets/assets/svgicons/phone.svg": "71f1e3560e12ce15023903d6ed3d1a46",
"assets/assets/svgicons/web.svg": "84dcdd6f1fb8c5c7b8926801d78a7cc6",
"assets/assets/svgicons/aol.svg": "88c6856834c76ab452950edfb6a43059",
"assets/assets/svgicons/google-plus.svg": "16b3d31346e8513b40239d6e31bba1a7",
"assets/assets/svgicons/account-multiple-plus.svg": "d2136e49c3a03084af8696c1523b88e1",
"assets/assets/svgicons/linkedin.svg": "18413b4fe3ee7e89ae6f54b8aece5a0a",
"assets/assets/svgicons/twitter.svg": "5415e602a170324d294afc13a6a315a7",
"assets/assets/svgicons/small-star.svg": "342cdaa2cf28a6cc7329d34987f39348",
"assets/assets/svgicons/arrow-left.svg": "374b9b0416b1fd6b8a949897751d495c",
"assets/assets/svgicons/skype.svg": "53717c451f3b0c5f100c0740fa49c9e3",
"assets/assets/svgicons/menu.svg": "1ce6d6e3cb9458492b65ed2a10a080f2",
"assets/assets/svgicons/apple.svg": "c4d126873377679092a443aa77151249",
"assets/assets/svgicons/shield-check.svg": "07ffca1b7cccf4a56413618a1feaee44",
"assets/assets/svgicons/icon-google.svg": "055006401c2b340cefc0d9e82e4df8cb",
"assets/assets/svgicons/clipboard-check.svg": "f9623657965971072658f97f5b7aeed7",
"assets/assets/svgicons/minus.svg": "7068fd5fb1f60e0078e1eb985fc66152",
"assets/assets/svgicons/help-circle.svg": "2cce5ebb12e1bbcafec1d1213a77e592",
"assets/assets/svgicons/chevron-left.svg": "f88c00eb4e61d7d733c46aec124b5aff",
"assets/assets/svgicons/information-variant.svg": "b67d6190e043901829cd11ab650b3129",
"assets/assets/fonts/SourceSansPro-Regular.ttf": "47dbe5824a2d82b794ef1f52809699a5",
"assets/assets/fonts/SourceSansPro-Bold.ttf": "09ad953751e1109778ece9318df70540",
"assets/assets/fonts/ProximaNovaFont.otf": "bf9f5d50c1b928ff21436517a1a95ad9",
"assets/assets/fonts/SourceSansPro-Light.ttf": "e7208e0bdca1887f658b9ac66c988a95",
"assets/assets/fonts/SourceSansPro-SemiBold.ttf": "c1b4f417cf21451e85a0baccbfd8edc8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
