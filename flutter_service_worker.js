'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "9b6801a620a0c967ecbc3eb309caba4f",
"assets/assets/data_jobs/jobs.json": "f4843f40a69feb9a82479df386e7b47d",
"assets/assets/dummy/cover_image.png": "8dd88a84dd259d5393c57824fe907d87",
"assets/assets/dummy/my_reference.png": "25dca4a7e0272a7ae243655ce4c83a5b",
"assets/assets/dummy/play.png": "130c717394b7a118860ee302c45b378d",
"assets/assets/fonts/source_sans_pro/SourceSansPro-Regular.ttf": "47dbe5824a2d82b794ef1f52809699a5",
"assets/assets/png/Avatar.png": "9f7407b5523ff5840d1141512bd106aa",
"assets/assets/png/Cover.png": "3a4a1bf3d7c9c625f6cb60678b7ced72",
"assets/assets/png/job_details_big_image.png": "da8a2daf7b9f455eb14a908d8941d7ae",
"assets/assets/png/job_detail_1.png": "69b5d177b3cc65835569b24f6d7b2715",
"assets/assets/png/job_detail_2.png": "81640b297f828091ccc0a9e426f9f1ff",
"assets/assets/png/job_detail_3.png": "cfedfeb085a0a0be4099d69020b3577f",
"assets/assets/png/job_detail_4.png": "ef3548b11243fb43d4b9957ab9c4dec0",
"assets/assets/png/job_detail_5.png": "285ff7ce2eb33c2edbac99f730980e9f",
"assets/assets/png/logo_icon.png": "50280a1f97fe723500d7a9fce787df65",
"assets/assets/png/person.png": "62b369abe9454ddb729630857ccd72ff",
"assets/assets/svgs/account-box.svg": "41d6275d051430d95d8e387505aebd20",
"assets/assets/svgs/account-cirlce.svg": "8180bd795ed792764592a8e49627ad24",
"assets/assets/svgs/account-group.svg": "43f510457714d8a2fadd5f8ffd1f2eb1",
"assets/assets/svgs/account-multiple-plus.svg": "dc92ddadfc20b4955ccb4b98b176b62c",
"assets/assets/svgs/account-multiple.svg": "603cb46d1d60bc9f5be2d721e34d815f",
"assets/assets/svgs/account-plus.svg": "9391cf19aef2e14e06a5fb3635103697",
"assets/assets/svgs/aol.svg": "743bc6de790c1a58df63e1a1325f0b51",
"assets/assets/svgs/app/applyForJob.svg": "892beebd26423f25e2ac9c4d62ba50f1",
"assets/assets/svgs/app/search_icon.svg": "a0a31ea3fb4dd12ffdb56a35d7bc1a80",
"assets/assets/svgs/arrow-all.svg": "8c67d06af90799f919ad02e52cbfa9b8",
"assets/assets/svgs/arrow-left.svg": "acd867e48eadb502251429b005336587",
"assets/assets/svgs/arrow-right-bold.svg": "7634ba95aa16b9a5ce33eaa969dee826",
"assets/assets/svgs/arrow-right.svg": "be47a4e1921c887ba09ffecdf4dbb3fb",
"assets/assets/svgs/briefcase.svg": "b07cd09b0d30587507e330d5c6e575a8",
"assets/assets/svgs/camera.svg": "d4f3c143c3258904b71b505b6d1d5dfe",
"assets/assets/svgs/card-account-phone.svg": "938b8ab51f5334cd576a1a50319bbf6e",
"assets/assets/svgs/cellphone.svg": "c7e7a12882d7a5b99354c005869e595a",
"assets/assets/svgs/chart-timeline-variant.svg": "04b875f95682fd74a63662d1b4a71f67",
"assets/assets/svgs/check-circle.svg": "71c00a52e3c24a4d0c1e414c8adadab1",
"assets/assets/svgs/check.svg": "60537ace03330f9732f6ec2c89317504",
"assets/assets/svgs/checkbox-marked.svg": "88f16adba5326cf4c3186e3a8c13edc3",
"assets/assets/svgs/chevron-down.svg": "34a49774a5c96eca28c5ac976fd905e5",
"assets/assets/svgs/chevron-left.svg": "bfc56d6fbdd93dacf24a195df7dd4445",
"assets/assets/svgs/chevron-right.svg": "eb2ba62af1b045fa53dd7b0691d2045a",
"assets/assets/svgs/chevron-up.svg": "dcaa44d0c6bb2c48aa0188d6b7432431",
"assets/assets/svgs/clipboard-check.svg": "af922f255642387cf2321dd9ff524e33",
"assets/assets/svgs/close.svg": "1bab6e3ed2ffe1d20e7db8bd1bdb3b39",
"assets/assets/svgs/delete.svg": "4ae4a838dccfa917bba3b19e5ec37ae3",
"assets/assets/svgs/domain.svg": "915bd06071710c4bb386efdfe7180066",
"assets/assets/svgs/download.svg": "69177add5584b9bbc2f2f2e63c7d1db8",
"assets/assets/svgs/earth.svg": "96e3a9d2cb9e0adf9ec3a9fc37910ada",
"assets/assets/svgs/email-open.svg": "64be0ee5e364bf4b1b75d7ed174455c9",
"assets/assets/svgs/email.svg": "dff1ca8e2fafabd8603e3752d542565d",
"assets/assets/svgs/emailbook.svg": "3ba552be49a49a14663d798a852520cc",
"assets/assets/svgs/eye-off.svg": "eff5fcf19ab7ea0b709de4bba147785c",
"assets/assets/svgs/facebook.svg": "dbc57af7ced505ce0a7bb2f72eabd7fa",
"assets/assets/svgs/flag.svg": "bdc491f1c54411feb446d08c42932f74",
"assets/assets/svgs/format-quote-open.svg": "f72ed6eefe904d971d9d62567a05c3b7",
"assets/assets/svgs/format-text-variant.svg": "6ffb5587b86a819ff0580f420cff58c5",
"assets/assets/svgs/forum.svg": "fd647b3d66f569ba17bde886609efc4d",
"assets/assets/svgs/gmail.svg": "3a9191f6c6a9a0bddb768b9435bc8ffd",
"assets/assets/svgs/heart-outline.svg": "5207ff784a6cc8474f2cafb3c6779dc9",
"assets/assets/svgs/help-circle.svg": "39edaf440f3b145204ac373c48ddc9e7",
"assets/assets/svgs/information-variant.svg": "72f77b79dc81c81a088b4623e6c2aa86",
"assets/assets/svgs/information.svg": "b78ae13436f54dc422fe5ce3787b3099",
"assets/assets/svgs/key.svg": "4b8b80b42e75e0bb5e34b1eb3659866a",
"assets/assets/svgs/link.svg": "54c11847eaec6f3bcb2aace1bf6c4369",
"assets/assets/svgs/lock-outline.svg": "2acc143a0a9d1daa38c5ee81051cc7d2",
"assets/assets/svgs/lock.svg": "4a57917d102c9795ce1f649ae98a2cb1",
"assets/assets/svgs/logo_icon.svg": "bbda09e70f036a2ccf6e3b702cd1869e",
"assets/assets/svgs/magnify.svg": "deb58e97383daa7df337d3536b61e45f",
"assets/assets/svgs/map-marker.svg": "d63665fe0c03bfa3448e8e13546e5f41",
"assets/assets/svgs/map.svg": "ffc9975b7eab6093b04fef2c7f1929f7",
"assets/assets/svgs/marker-check.svg": "25dea894e47cc0b302f0c5db55445106",
"assets/assets/svgs/menu-down.svg": "416358062cf6cf3ab223a07f0220237f",
"assets/assets/svgs/menu-left.svg": "f85a493a5a6abc9d52ec96bb04c90b08",
"assets/assets/svgs/menu-right.svg": "f50ac91f3632941da9476f3da90d7136",
"assets/assets/svgs/menu.svg": "db8da0a654e6aa39fbbf8470c6df2314",
"assets/assets/svgs/message-reply-text.svg": "497cc63f4770aa623a8fa5a7c65a9c22",
"assets/assets/svgs/minus.svg": "08890d60acf6914b0229df0258b762a2",
"assets/assets/svgs/pencil.svg": "4ff9d2e008f3b0dd0932d318db881eef",
"assets/assets/svgs/phone.svg": "c16fdddc684ebae211428115738aef48",
"assets/assets/svgs/plaxo.svg": "c6af34bc0b6f4442463777e0a972772f",
"assets/assets/svgs/play.svg": "41b8e3e69db281247881ca2d1e19fe1e",
"assets/assets/svgs/plus-box.svg": "81e76ec7f98dc4e333a89a5d06cdca5e",
"assets/assets/svgs/plus.svg": "86b3dc279b3b66b51155dfa397ea475b",
"assets/assets/svgs/school.svg": "41bc06032181a19a5ec005d8cb6d71dd",
"assets/assets/svgs/shield-check.svg": "1ce88b4e615b8eee5e8e6f9cc69a7f74",
"assets/assets/svgs/shield-half.svg": "f5377c57cb430bf9b5c90ccfae86c156",
"assets/assets/svgs/shield.svg": "7400b0f66df82d010d66bcd6b972100b",
"assets/assets/svgs/small-star.svg": "28401da576624700d0f082184bc91e71",
"assets/assets/svgs/social/apple.svg": "119b2e0a3c8dff529ae7bfd40b8d2de8",
"assets/assets/svgs/social/facebook.svg": "84ff1e26627f3d51d19a099ba6f8491f",
"assets/assets/svgs/social/google.svg": "01ea302865f80049165d0aa486fe05f8",
"assets/assets/svgs/social/instagram.svg": "19855cc857f94bb5b407a6f00b40f690",
"assets/assets/svgs/social/linkedin.svg": "57718dd16bd56988c114bb03cfdcce6e",
"assets/assets/svgs/social/outlook.svg": "961ae176c357fd285a41af92f38ac900",
"assets/assets/svgs/social/pinterest.svg": "c41eee146d1d0646a9e0d87fa3d2b4a3",
"assets/assets/svgs/social/skype.svg": "ad0d274b25006f6eb73a18f4a8aa5731",
"assets/assets/svgs/social/twitter.svg": "01b087e54e26430647dd2575211b9049",
"assets/assets/svgs/social/whatsapp.svg": "10cca3ff2a52adcc39dd8a5a9a3ff5db",
"assets/assets/svgs/social/xing.svg": "f92b37fd770f9f17bcaf43fc7db7b079",
"assets/assets/svgs/social/yahoo.svg": "c20680436e597bfe3050edece751c117",
"assets/assets/svgs/social/youtube.svg": "9124c78908a9e6a184606e671dc4129e",
"assets/assets/svgs/social_sharing/facebook.svg": "816e388baa66b55462d18646d56e2266",
"assets/assets/svgs/social_sharing/googleplus.svg": "0219adc6476684ef7816eb229e40eb2b",
"assets/assets/svgs/social_sharing/linkedin.svg": "520a3b782bc6edc63cd2fd5462c7e810",
"assets/assets/svgs/social_sharing/twitter.svg": "aac9be299689d220b69ea01eefa49f58",
"assets/assets/svgs/social_sharing/xing.svg": "9306f9c35903f71dbfc64d91876c9927",
"assets/assets/svgs/spinner.svg": "d5b3d6736c3c260eae3934b485b88e11",
"assets/assets/svgs/swap-horizontal.svg": "be459150bcfc1cd006f52665237dd5cd",
"assets/assets/svgs/thumb-up.svg": "4030a9557b6d35b747089f1ea5f4a643",
"assets/assets/svgs/warning.svg": "26f9a9103d32a8dbf1f96ec7406159ea",
"assets/assets/svgs/web.svg": "26d5b2c3657a457c3462eb5265530106",
"assets/FontManifest.json": "e6d6244f110a843e137c08770bde7850",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "ba431b8d0e21a02dc26952317e2fc7ac",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttericon/lib/fonts/Brandico.ttf": "791921e9b25210e2551b6eda3f86c733",
"assets/packages/fluttericon/lib/fonts/Elusive.ttf": "23f24df0388819e94db2b3c19841841c",
"assets/packages/fluttericon/lib/fonts/Entypo.ttf": "58edfaf27b1032ea4778b69297c02b5a",
"assets/packages/fluttericon/lib/fonts/FontAwesome.ttf": "799bb4e5c577847874f20bd0e9b38a9d",
"assets/packages/fluttericon/lib/fonts/FontAwesome5.ttf": "221b27a41202ddd33990e299939e4504",
"assets/packages/fluttericon/lib/fonts/Fontelico.ttf": "3a1e1cecf0a3eae6be5cba3677379ba2",
"assets/packages/fluttericon/lib/fonts/Iconic.ttf": "34e12214307f5f7cf7bc62086fbf55a3",
"assets/packages/fluttericon/lib/fonts/LineariconsFree.ttf": "276b1d61e45eb9b2dde9482545d9e3ac",
"assets/packages/fluttericon/lib/fonts/Linecons.ttf": "2d0ac407ed11860bf470cb01745fb144",
"assets/packages/fluttericon/lib/fonts/Maki.ttf": "9ecdcd7d24a2461a55d532b86b2740bd",
"assets/packages/fluttericon/lib/fonts/Meteocons.ttf": "8b9c7982496155bb39c67eaf2a243731",
"assets/packages/fluttericon/lib/fonts/MfgLabs.ttf": "09daa533ea11600a98e3148b7531afe3",
"assets/packages/fluttericon/lib/fonts/ModernPictograms.ttf": "5046c536516be5b91c15eb7795e0352d",
"assets/packages/fluttericon/lib/fonts/Octicons.ttf": "7242d2fe9e36eb4193d2bc7e521779bf",
"assets/packages/fluttericon/lib/fonts/RpgAwesome.ttf": "99232001effca5cf2b5aa92cc3f3e892",
"assets/packages/fluttericon/lib/fonts/Typicons.ttf": "3386cae1128e52caf268508d477fb660",
"assets/packages/fluttericon/lib/fonts/WebSymbols.ttf": "4fd66aa74cdc6e5eaff0ec916ac269c6",
"assets/packages/fluttericon/lib/fonts/Zocial.ttf": "c29d6e34d8f703a745c6f18d94ce316d",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"images/logo.png": "85cfc98bb9a8aa56d83e3c6f4fc103a5",
"index.html": "af12de457b3fc9047ba3dab4c168cdb9",
"/": "af12de457b3fc9047ba3dab4c168cdb9",
"main.dart.js": "6511919865744b7d2c7133972bfeb518",
"manifest.json": "e461f93e05a3a68319d3683954bd7966",
"version.json": "0eb302c999a6f309ddd3e11c38a12d21"
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
