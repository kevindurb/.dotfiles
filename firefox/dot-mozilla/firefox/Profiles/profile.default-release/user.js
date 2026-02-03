user_pref('browser.ml.chat.menu', false);
user_pref('browser.ml.linkPreview.enabled', false);
user_pref('browser.tabs.groups.smart.enabled', false);
user_pref('browser.ml.chat.enabled', false);
user_pref('browser.ml.chat.page.footerBadge', false);
user_pref('browser.ml.enable', false);

user_pref('sidebar.new-sidebar.has-used', true);
user_pref('sidebar.verticalTabs', true);
user_pref('sidebar.verticalTabs.dragToPinPromo.dismissed', true);

user_pref('browser.urlbar.trending.featureGate', false);

/****************************************************************************
 * SECTION: FASTFOX                                                         *
 ****************************************************************************/
/** GENERAL ***/
user_pref('gfx.content.skia-font-cache-size', 32);

/** GFX ***/
user_pref('gfx.webrender.layer-compositor', true);
user_pref('gfx.canvas.accelerated.cache-items', 32768);
user_pref('gfx.canvas.accelerated.cache-size', 4096);
user_pref('webgl.max-size', 16384);

/** DISK CACHE ***/
user_pref('browser.cache.disk.enable', false);

/** MEMORY CACHE ***/
user_pref('browser.cache.memory.capacity', 131072);
user_pref('browser.cache.memory.max_entry_size', 20480);
user_pref('browser.sessionhistory.max_total_viewers', 4);
user_pref('browser.sessionstore.max_tabs_undo', 10);

/** MEDIA CACHE ***/
user_pref('media.memory_cache_max_size', 262144);
user_pref('media.memory_caches_combined_limit_kb', 1048576);
user_pref('media.cache_readahead_limit', 600);
user_pref('media.cache_resume_threshold', 300);

/** IMAGE CACHE ***/
user_pref('image.cache.size', 10485760);
user_pref('image.mem.decode_bytes_at_a_time', 65536);

/** NETWORK ***/
user_pref('network.http.max-connections', 1800);
user_pref('network.http.max-persistent-connections-per-server', 10);
user_pref('network.http.max-urgent-start-excessive-connections-per-host', 5);
user_pref('network.http.request.max-start-delay', 5);
user_pref('network.http.pacing.requests.enabled', false);
user_pref('network.dnsCacheEntries', 10000);
user_pref('network.dnsCacheExpiration', 3600);
user_pref('network.ssl_tokens_cache_capacity', 10240);

/** SPECULATIVE LOADING ***/
user_pref('network.http.speculative-parallel-limit', 0);
user_pref('network.dns.disablePrefetch', true);
user_pref('network.dns.disablePrefetchFromHTTPS', true);
user_pref('browser.urlbar.speculativeConnect.enabled', false);
user_pref('browser.places.speculativeConnect.enabled', false);
user_pref('network.prefetch-next', false);

/****************************************************************************
 * SECTION: PESKYFOX                                                        *
 ****************************************************************************/
/** MOZILLA UI ***/
user_pref('extensions.getAddons.showPane', false);
user_pref('extensions.htmlaboutaddons.recommendations.enabled', false);
user_pref('browser.discovery.enabled', false);
user_pref('browser.shell.checkDefaultBrowser', false);
user_pref(
  'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons',
  false,
);
user_pref(
  'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features',
  false,
);
user_pref('browser.preferences.moreFromMozilla', false);
user_pref('browser.aboutConfig.showWarning', false);
user_pref('browser.startup.homepage_override.mstone', 'ignore');
user_pref('browser.aboutwelcome.enabled', false);
user_pref('browser.profiles.enabled', true);
