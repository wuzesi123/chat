//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dynamic_color/dynamic_color_plugin.h>
#include <emoji_picker_flutter/emoji_picker_flutter_plugin.h>
#include <fast_rsa/fast_rsa_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) dynamic_color_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DynamicColorPlugin");
  dynamic_color_plugin_register_with_registrar(dynamic_color_registrar);
  g_autoptr(FlPluginRegistrar) emoji_picker_flutter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "EmojiPickerFlutterPlugin");
  emoji_picker_flutter_plugin_register_with_registrar(emoji_picker_flutter_registrar);
  g_autoptr(FlPluginRegistrar) fast_rsa_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FastRsaPlugin");
  fast_rsa_plugin_register_with_registrar(fast_rsa_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
