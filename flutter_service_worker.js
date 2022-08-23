'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2a8c5c86a36799c923836b7ea8f0e41d",
"assets/assets/fonts/ProximaNovaFont.otf": "bf9f5d50c1b928ff21436517a1a95ad9",
"assets/assets/fonts/SourceSansPro-Bold.ttf": "09ad953751e1109778ece9318df70540",
"assets/assets/fonts/SourceSansPro-Light.ttf": "e7208e0bdca1887f658b9ac66c988a95",
"assets/assets/fonts/SourceSansPro-Regular.ttf": "47dbe5824a2d82b794ef1f52809699a5",
"assets/assets/fonts/SourceSansPro-SemiBold.ttf": "c1b4f417cf21451e85a0baccbfd8edc8",
"assets/assets/icons/cloud.png": "b2bcb2d12099ecaedaec74c51dcbbae0",
"assets/assets/icons/cloudwhite.svg": "8bf101080888ea9f3bf6e16a6023ac19",
"assets/assets/icons/comment.png": "704f896edaf0d5f25a0f475298782e57",
"assets/assets/icons/fb.png": "43f42d20e02f56a82d14bd4a55428abe",
"assets/assets/icons/gp.png": "90c94c3a37f7a02adfd63de344dbaab4",
"assets/assets/icons/info.png": "350181c77137da7cad96ecfc809c3831",
"assets/assets/icons/invot.png": "3e4eba51a3ddcfea3e0012222d01449b",
"assets/assets/icons/invot1.png": "94742ca9582cd80bc83461c499ff0358",
"assets/assets/icons/like.png": "5998b913a9e7d623416997538c8af7f7",
"assets/assets/icons/linkdin.png": "a5636cbb561561219891a593683c6d0a",
"assets/assets/icons/lock.png": "3b3b89fa7bd4ed8a69a96dd4dc2e37b7",
"assets/assets/icons/logo.png": "fed4945c3a75c1bbb93ac84b4b178d7c",
"assets/assets/icons/logo1.png": "7feb263bf2f3e13038104ce427ba2617",
"assets/assets/icons/menu.png": "da73da9e7e3ee89f8e92bd65b369c74a",
"assets/assets/icons/mobileLogo.png": "cad512f2b256efccf9c127be7672629c",
"assets/assets/icons/play_arrow.svg": "80b673c740128a386902749eca235524",
"assets/assets/icons/play_whole.png": "9f8516419c5114207f73301dcc5885fc",
"assets/assets/icons/right.png": "9c931367a0dec9e3cc950ecb3e98b00b",
"assets/assets/icons/rightShield.png": "04bc1682c4132ed426e1611a145038d5",
"assets/assets/icons/share.png": "443efcbe3070f32a2dc9f5032b6f24f6",
"assets/assets/icons/shield.png": "ebb51141b15678a80d5f47d5140fdea7",
"assets/assets/icons/svg/any.svg": "a331f0dfa94d1fa1827e4913238f6ec3",
"assets/assets/icons/svg/facebook.svg": "12ee1bfc06e686c3c068a0d2a9f1ba41",
"assets/assets/icons/svg/googleplus.svg": "c5ed3ef484e7f36a7fbfde2b2a6740d8",
"assets/assets/icons/svg/linkdin.png": "babbb01f49b10fd338636a6cd42183af",
"assets/assets/icons/svg/linkdin.svg": "58759f5810418bfe2eb5f24704b992ec",
"assets/assets/icons/svg/twitter.svg": "a11d503b3a5af980e842d27c89090cf9",
"assets/assets/icons/twitter.png": "228535ca2f0675cec8cd333cb81bd052",
"assets/assets/icons/x.png": "831395a9dd0fe15f14d2931ae0dce650",
"assets/assets/images/airbnb.png": "3057a9c349bf063959d70b8cd01e13ab",
"assets/assets/images/alone_girl.png": "3c78817882dfb51b9ed32202e2d4b591",
"assets/assets/images/avatar.png": "fb1b4cd8950c24faee16c35233b75521",
"assets/assets/images/Background.png": "3572dfec0b1c067a8d757e11904eb2c6",
"assets/assets/images/badge.png": "d6651b15f67d6646fc2bc8378d88e673",
"assets/assets/images/BannerImage.png": "2ec4e487b30a7fb06d6549407ec2645c",
"assets/assets/images/circle.png": "8b85727a475496804cfdf1aeb403b350",
"assets/assets/images/companyBanner.png": "7387fc5a2e5345dbf5513992bf34c8f8",
"assets/assets/images/couple_bg.png": "2e9fd04440df800ecf95720fb5f564d8",
"assets/assets/images/E1.png": "d8b36fffe44ebbdcdbd0027932e4dc75",
"assets/assets/images/E2.png": "43607a628a2825082dc8d36c67720b74",
"assets/assets/images/fairmont_logo.png": "0997a125f4403c0df428c14716df4285",
"assets/assets/images/hilton_logo.png": "fb1befba4fda0ceaacd57ec96d1fddf3",
"assets/assets/images/l1.png": "5b36994570b5fface25a15caace4c469",
"assets/assets/images/l2.png": "2591142b8d9b92937fadbc39cf2a86b0",
"assets/assets/images/l3.png": "be57d138dd4c35a27091286a4c418581",
"assets/assets/images/l4.png": "41a9bb422bba4668959ce5a3d2a8e959",
"assets/assets/images/l5.png": "46fa146db5d554085c65ac813e547c78",
"assets/assets/images/nasa.png": "b1a711af7c304238615cce4d82185cb4",
"assets/assets/images/news.png": "95209c7e3e410f06cd94bb4c759a6d4e",
"assets/assets/images/news1.png": "f29692893c25656e96544e0b059f7ce5",
"assets/assets/images/news2.png": "344369948d15dd8de9e4ef13e98bc260",
"assets/assets/images/p1.png": "48ab1bb9c8a03a8e0d79293857ab3352",
"assets/assets/images/p2.png": "39b8f4eb30aded0aa26492d3578dd30e",
"assets/assets/images/p3.png": "bf695010af7f4fd2eaa6f990240a5290",
"assets/assets/images/p4.png": "7e4437cebe351731f9f5fd7c5ce0d849",
"assets/assets/images/p5.png": "aca3b8b81a1968473ed477546084404e",
"assets/assets/images/people2.png": "fb54122495d56154ff5262d30ad72307",
"assets/assets/images/profile.png": "e726998baf1278d6fd601e84617bd18f",
"assets/assets/images/profile2.png": "21e88aec567ed00962d3468f2d063451",
"assets/assets/images/profile3.png": "0c8bc4b92ada46e15ebcb74fa13adf22",
"assets/assets/images/profile4.png": "87a380bb601cac46629472f3f5c14fcf",
"assets/assets/images/profileAdsBanner.png": "101623c6057dc514e795794ab619c796",
"assets/assets/images/profileConnectionBanner.png": "a6907dec51acdd72ac32f89eb5c4347b",
"assets/assets/images/profilePic.png": "7d599d17c96af263e3ccd47ebbbfecc1",
"assets/assets/images/public.png": "1e44979f2cad8dff493ba2f558e8fe03",
"assets/assets/images/round.png": "f398026ae24ba9201767813cec52a362",
"assets/assets/images/round2.png": "3d72c80f25c26dcaf53cfa7c019d57de",
"assets/assets/images/share.png": "520205cd6fee5ea0c05b2039f495bd9c",
"assets/assets/images/slider1.png": "aa4d32623a4a9f039fe4f449a8990d07",
"assets/assets/images/slider2.png": "91f7dffe989f1d46cabd2d07eeec9b14",
"assets/assets/images/t1.png": "76c20347a513e188b546a756259be0ce",
"assets/assets/images/t10.png": "a1a3508636386ea890d4ed3a3d348e4a",
"assets/assets/images/t2.png": "07befbba8c14b5e5df93080034a42850",
"assets/assets/images/t3.png": "53c36d44245d086507d1b373a1f8fd5d",
"assets/assets/images/t4.png": "8bc65eb01ef94fc972b94749ecf37518",
"assets/assets/images/t5.png": "656259b59cd582774d6dda861073c07c",
"assets/assets/images/t6.png": "2247a2669f1c0200c56c4ddad3aae2d1",
"assets/assets/images/t7.png": "896d7fe8d1715308e2a9fe508fa792e1",
"assets/assets/images/t8.png": "6437a5ab12962cf437a3560a3c350c95",
"assets/assets/images/t9.png": "a1a3508636386ea890d4ed3a3d348e4a",
"assets/assets/images/twitter.png": "686bae9f5e21679681db4d3ac0c3d6f8",
"assets/assets/images/uploadImage.png": "a040ee64adab9adc44eb31fd09f80755",
"assets/assets/images/videoThumbnail.png": "d015f9ed6e0e95a1af84780f9c6845c4",
"assets/assets/images/winter.png": "8e079c058599ebe69d8240057e290a71",
"assets/assets/svgicons/account-box.svg": "d812343db89223942738bfbbb98b685f",
"assets/assets/svgicons/account-cirlce.svg": "1d17d74f8a66453bf68675b11bd20a85",
"assets/assets/svgicons/account-group.svg": "f65cb1ed971237354f0f650a4128aa9f",
"assets/assets/svgicons/account-multiple-plus.svg": "700448ce8a6cd523879b73626f11f6ae",
"assets/assets/svgicons/account-multiple.svg": "480f240a3d81a9a315eb69574f17866c",
"assets/assets/svgicons/account-plus.svg": "d612bb209d0fbf917d6447bf01c1f739",
"assets/assets/svgicons/aol.svg": "b85645a6b6881f8b936f2545a6cd0d14",
"assets/assets/svgicons/apple.svg": "d1cd792b70a7ef599534b9f07c7863d4",
"assets/assets/svgicons/arrow-all.svg": "55830b0a8920f4305a49edc83d58d356",
"assets/assets/svgicons/arrow-left.svg": "09170fa67f9be66256ab320738f2e1cc",
"assets/assets/svgicons/arrow-right-bold.svg": "f68e6483846329cee83b59ab936f03fe",
"assets/assets/svgicons/arrow-right.svg": "25b67f2f04704570556b2a8fa52c8f95",
"assets/assets/svgicons/briefcase.svg": "2c7002fd6d5d48e8fb6f19948612c160",
"assets/assets/svgicons/camera.svg": "83aca73a00913a28592a6e32f301a67c",
"assets/assets/svgicons/card-account-phone.svg": "720622c8196d459fa43f0ff121112984",
"assets/assets/svgicons/cellphone.svg": "14244608f624df05fff90493176d90fb",
"assets/assets/svgicons/chart-timeline-variant.svg": "3ebc272ad0f03f10d36bd006848792fd",
"assets/assets/svgicons/check-circle.svg": "1a2bc5fcd2db48619a1f4a0531b69718",
"assets/assets/svgicons/check.svg": "e770588525dd7403985f5f069df6137b",
"assets/assets/svgicons/checkbox-marked.svg": "85713ab6b27d59f05ae9ca36e67331b8",
"assets/assets/svgicons/chevron-down.svg": "1606d5919982687b8e6070d8db9d2134",
"assets/assets/svgicons/chevron-left.svg": "dc7d88a2e145ae8600a739f8a3620a7a",
"assets/assets/svgicons/chevron-right.svg": "1bb80e14f062cf49cdaacb9af95e4148",
"assets/assets/svgicons/chevron-up.svg": "05daa5f304c62e025f4828c5cab248bf",
"assets/assets/svgicons/clipboard-check.svg": "c7bf4390fe6e94cde19ae809a638819f",
"assets/assets/svgicons/close.svg": "6d21c5fa810ae79a3b44c70eac6768df",
"assets/assets/svgicons/delete.svg": "4ce30f49ee5851d7dd71f7b6c8f4fd3d",
"assets/assets/svgicons/domain.svg": "7e128283c86ff0c6f797efd39d95c3b0",
"assets/assets/svgicons/download.svg": "158199f480fced132c0361b15620638a",
"assets/assets/svgicons/earth.svg": "7acf2b75e602735263f1225371645c22",
"assets/assets/svgicons/email-open.svg": "5eed885ab517f78106936ee2cb99a0e3",
"assets/assets/svgicons/email.svg": "d8ee1441d313ed1c4295a06f618203fc",
"assets/assets/svgicons/emailbook.svg": "91d691cc3b95619022de457b71937eef",
"assets/assets/svgicons/eye-off.svg": "641a375cae18b250f84a8c77789175c8",
"assets/assets/svgicons/facebook.svg": "a0c2a0f2ccd1ecb64d8bd470a6e9a027",
"assets/assets/svgicons/flag.svg": "1d4b374216e5f3adb163c117c9d39588",
"assets/assets/svgicons/format-quote-open.svg": "b02e384f8a126889b5aa9dbe8adb68d3",
"assets/assets/svgicons/format-text-variant.svg": "a224e5a23faabb61bee6282465f64d35",
"assets/assets/svgicons/forum.svg": "1a75c1308b67eee10a11f915268c6c9d",
"assets/assets/svgicons/gmail.svg": "fe635b05432bcb6b3855ae96bf03d842",
"assets/assets/svgicons/google-plus.svg": "e6c42d38989df30f6365c85e9e30d460",
"assets/assets/svgicons/heart-outline.svg": "ba023445f41eaa2bebcba8e8f246f934",
"assets/assets/svgicons/help-circle.svg": "21395f225201b706b20b0fc3e1046cd1",
"assets/assets/svgicons/icon-google.svg": "0847751515d13fc66e98e1c63931fab2",
"assets/assets/svgicons/information-variant.svg": "a96c50cca009630b53bd47382a141967",
"assets/assets/svgicons/information.svg": "86cc6a713348438c956d0cb042aec2a4",
"assets/assets/svgicons/instagram.svg": "f40b0d36b80380565b1b19721715b240",
"assets/assets/svgicons/key.svg": "aa54e5d5350609e5e45a114949f980ff",
"assets/assets/svgicons/link.svg": "d52253a5f8261529ee829efdb58ee34b",
"assets/assets/svgicons/linkedin.svg": "e2182a5054a5c798fb586e13f92f28c9",
"assets/assets/svgicons/lock-outline.svg": "eba0ab24fb1f16ee9313934a14b83d43",
"assets/assets/svgicons/lock.svg": "ff463a29ce4795bbb50198af5b09d8b5",
"assets/assets/svgicons/magnify.svg": "0be0583575e7b855a4f8c409bdbb0b4b",
"assets/assets/svgicons/map-marker.svg": "7f6b2458a201bd721af6668d1ef01098",
"assets/assets/svgicons/map.svg": "5bf44582c9fd4dfd5e4257521cd21cdc",
"assets/assets/svgicons/marker-check.svg": "27fa83fa4de1d7e19ee7fac35cb3ac71",
"assets/assets/svgicons/menu-left.svg": "967877b506f3ced4a6a0ae75d32aad11",
"assets/assets/svgicons/menu-right.svg": "a1f06b7c0593cf552409d21ef99476e2",
"assets/assets/svgicons/menu.svg": "e8a95b69ee8e710f29d0fa25b888f013",
"assets/assets/svgicons/menuAboveArrow.svg": "34a0e6593c661821fbbf1cf9280ae0f7",
"assets/assets/svgicons/menuDown.svg": "d832c97a72e8848302f7debdffa23cea",
"assets/assets/svgicons/message-reply-text.svg": "fdfeebf86de3a0c8fab0d75c5d675c90",
"assets/assets/svgicons/minus.svg": "8015dc5667d21f177cb133a44e8c7eac",
"assets/assets/svgicons/outlook.svg": "2002a2a8e8f786de0bc5dbaf4f148462",
"assets/assets/svgicons/pencil.svg": "5798622a9f45e82a793c5c8206cbfa5b",
"assets/assets/svgicons/phone.svg": "52cf237fc3a3a5fc276b3518ba9e9208",
"assets/assets/svgicons/pinterest.svg": "cbfc75783df17cb3d6f55eb840c6045f",
"assets/assets/svgicons/plaxo.svg": "cb0b29c2aae98873d6e8f621ab4797b2",
"assets/assets/svgicons/play.svg": "7a794a104e39d8623d640d3db757f80e",
"assets/assets/svgicons/plus-box.svg": "e4277f6413ce16d9124e74a19686d3a0",
"assets/assets/svgicons/plus.svg": "0bcd43d459e7963d07e3b398a3f19ecc",
"assets/assets/svgicons/school.svg": "adf2e3035f46938674ccb7863accb163",
"assets/assets/svgicons/shield-check.svg": "e8686de0c8fb8f32fbc9e1686188780e",
"assets/assets/svgicons/shield-half.svg": "3f7a1f2fd905642bc369be52e2b68b28",
"assets/assets/svgicons/shield.svg": "819d65cb339e2eb00b495bc5d53fea8c",
"assets/assets/svgicons/skype.svg": "6f93cef912299732bc05990072916f5d",
"assets/assets/svgicons/small-star.svg": "5d47370eb91fc58273dec608d8e79b80",
"assets/assets/svgicons/spinner.svg": "926161a2deb328b14ea58365146d6606",
"assets/assets/svgicons/swap-horizontal.svg": "52994c5c8371b4e45b260eac5fd59b58",
"assets/assets/svgicons/thumb-up.svg": "cd1b332696851270685a188a013dd4b0",
"assets/assets/svgicons/twitter.svg": "2e53513ad4af12dc2aef6fafc8e5a695",
"assets/assets/svgicons/warning.svg": "84597bffca4beb93424eac4a56dc6725",
"assets/assets/svgicons/web.svg": "e40f98f9981c81910c51d3c51eed6f70",
"assets/assets/svgicons/whatsapp.svg": "cf509723793b5ab0e5815d0efd0d720f",
"assets/assets/svgicons/xing.svg": "36f9982fd504ff7810f6ae03da3fe942",
"assets/assets/svgicons/yahoo.svg": "96967936f141da2b4c36ea10bd860742",
"assets/assets/svgicons/youtube.svg": "45bfe976c300fac8c35638c45d3a7064",
"assets/FontManifest.json": "2d104196d9f5c542e2f417e3eefb603f",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "2807e5eebe463c54d18277ee8aa99cb0",
"assets/packages/awesome_dialog/assets/flare/error.flr": "e3b124665e57682dab45f4ee8a16b3c9",
"assets/packages/awesome_dialog/assets/flare/info.flr": "bc654ba9a96055d7309f0922746fe7a7",
"assets/packages/awesome_dialog/assets/flare/info2.flr": "21af33cb65751b76639d98e106835cfb",
"assets/packages/awesome_dialog/assets/flare/info_without_loop.flr": "cf106e19d7dee9846bbc1ac29296a43f",
"assets/packages/awesome_dialog/assets/flare/question.flr": "1c31ec57688a19de5899338f898290f0",
"assets/packages/awesome_dialog/assets/flare/succes.flr": "ebae20460b624d738bb48269fb492edf",
"assets/packages/awesome_dialog/assets/flare/succes_without_loop.flr": "3d8b3b3552370677bf3fb55d0d56a152",
"assets/packages/awesome_dialog/assets/flare/warning.flr": "68898234dacef62093ae95ff4772509b",
"assets/packages/awesome_dialog/assets/flare/warning_without_loop.flr": "c84f528c7e7afe91a929898988012291",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"assets/packages/flutter_vector_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_vector_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_vector_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_vector_icons/fonts/Feather.ttf": "e766963327e0a89f9ec2ba88646b6177",
"assets/packages/flutter_vector_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Brands.ttf": "13685372945d816a2b474fc082fd9aaa",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Regular.ttf": "db78b9359171f24936b16d84f63af378",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Solid.ttf": "1ab236ed440ee51810c56bd16628aef0",
"assets/packages/flutter_vector_icons/fonts/Fontisto.ttf": "b49ae8ab2dbccb02c4d11caaacf09eab",
"assets/packages/flutter_vector_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_vector_icons/fonts/Ionicons.ttf": "b3263095df30cb7db78c613e73f9499a",
"assets/packages/flutter_vector_icons/fonts/MaterialCommunityIcons.ttf": "6a2ddad1092a0a1c326b6d0e738e682b",
"assets/packages/flutter_vector_icons/fonts/MaterialIcons.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/packages/flutter_vector_icons/fonts/Octicons.ttf": "8e7f807ef943bff1f6d3c2c6e0f3769e",
"assets/packages/flutter_vector_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_vector_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "595593e1abc8cbbf8e1237d74e19a6cf",
"/": "595593e1abc8cbbf8e1237d74e19a6cf",
"main.dart.js": "d83cf9511b3448273a6d3f525113bfed",
"manifest.json": "12d13befd1ff2167d6aa471b22da2ca4",
"version.json": "793be19e5cd8b6c2aa8528aad64fff27"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
