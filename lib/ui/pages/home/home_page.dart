import 'package:flutter/material.dart';
import 'package:fungi_app/app/build_info.dart';
import 'package:fungi_app/ui/pages/home/dashboard_page.dart';
import 'package:fungi_app/ui/pages/home/local_services_page.dart';
import 'package:fungi_app/ui/pages/home/node_management_page.dart';
import 'package:fungi_app/ui/pages/settings/settings.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:fungi_app/ui/widgets/service_overlay.dart';
import 'package:get/get.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';

const Color _devChromeColor = Color(0xFF5B3FFF);
const Color _devChromeTextColor = Color(0xFFF4F1FF);
const Color _devLogoColor = Color(0xFFF0C79D);

class LabeledText extends StatelessWidget {
  final String label;
  final String value;
  final Widget? valueWidget;
  final String separator;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final double labelWidth;

  const LabeledText({
    super.key,
    required this.label,
    required this.value,
    this.valueWidget,
    this.separator = ":  ",
    this.labelStyle,
    this.style,
    this.labelWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: labelWidth,
          alignment: Alignment.centerLeft,
          child: Text(label, style: labelStyle ?? style),
        ),
        Text(separator, style: labelStyle ?? style),
        Flexible(
          child:
              valueWidget ??
              Text(
                value,
                style: style,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
        ),
      ],
    );
  }
}

class HomeHeader extends GetView<FungiController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final isDevChannel = !AppBuildInfo.isStable;
    final headerColor = isDevChannel
        ? _devChromeColor
        : colorScheme.primaryContainer;
    final headerAccentColor = isDevChannel
        ? Colors.white
        : colorScheme.surfaceTint;
    final headerTextColor = isDevChannel ? _devChromeTextColor : null;
    final headerPillColor = isDevChannel
        ? Colors.white.withValues(alpha: 0.16)
        : colorScheme.surface.withValues(alpha: 0.5);
    final headerPillTextColor = isDevChannel
        ? Colors.white
        : colorScheme.onSurfaceVariant;

    return Container(
      decoration: BoxDecoration(color: headerColor),
      child: Column(
        children: [
          SizedBox(height: statusBarHeight),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: controller.openDocumentation,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                      height: 50,
                      color: isDevChannel ? _devLogoColor : colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isDevChannel)
                      LabeledText(
                        label: 'Channel',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: headerAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                        value: 'Dev',
                        style: TextStyle(
                          fontSize: 12,
                          color: headerTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (!controller.daemonConnectionState.value.isDisabled) ...[
                      LabeledText(
                        label: 'Hostname',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: headerAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                        value: controller.hostname.value.isEmpty
                            ? "Unknown"
                            : controller.hostname.value,
                        style: TextStyle(fontSize: 12, color: headerTextColor),
                      ),
                      LabeledText(
                        label: 'Peer ID',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: headerAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                        value: controller.peerId.value.length >= 5
                            ? controller.peerId.value.substring(0, 5)
                            : controller.peerId.value,
                        valueWidget: TruncatedId(
                          id: controller.peerId.value,
                          style: TextStyle(
                            fontSize: 12,
                            color: headerTextColor,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 2),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.daemonManagedExternally.value
                                ? 'Daemon session'
                                : 'Service state',
                            style: TextStyle(
                              fontSize: 12,
                              color: headerAccentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          ':  ',
                          style: TextStyle(
                            fontSize: 12,
                            color: headerAccentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (!controller.daemonConnectionState.value.isDisabled)
                          Text(
                            controller.daemonManagedExternally.value
                                ? 'CONNECTED'
                                : (controller
                                          .daemonConnectionState
                                          .value
                                          .isConnected
                                      ? 'ON'
                                      : 'OFF'),
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  controller
                                      .daemonConnectionState
                                      .value
                                      .isConnected
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        const SizedBox(width: 8),
                        if (controller.daemonManagedExternally.value)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: headerPillColor,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              'External',
                              style: TextStyle(
                                fontSize: 11,
                                color: headerPillTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        else
                          SizedBox(
                            height: 18,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Switch(
                                value: controller.isDaemonEnabled.value,
                                onChanged: (value) async {
                                  await controller.toggleDaemon();
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDevChannel = !AppBuildInfo.isStable;
    final tabBarColor = isDevChannel
        ? _devChromeColor
        : colorScheme.primaryContainer;
    final tabIndicatorColor = isDevChannel ? Colors.white : colorScheme.primary;

    return Scaffold(
      body: Column(
        children: [
          const HomeHeader(),
          Expanded(
            child: ServiceOverlay(
              child: DefaultTabController(
                initialIndex: 0,
                length: 4,
                child: Column(
                  children: [
                    Container(
                      color: tabBarColor,
                      child: TabBar(
                        tabs: const <Widget>[
                          Tab(text: "Home", height: 30),
                          Tab(text: "Peers", height: 30),
                          Tab(text: "Local", height: 30),
                          Tab(text: "Settings", height: 30),
                        ],
                        isScrollable: true,
                        indicatorColor: tabIndicatorColor,
                        labelColor: isDevChannel ? Colors.white : null,
                        unselectedLabelColor: isDevChannel
                            ? _devChromeTextColor.withValues(alpha: 0.72)
                            : null,
                      ),
                    ),
                    Expanded(
                      child: const TabBarView(
                        children: <Widget>[
                          DashboardPage(),
                          NodeManagementPage(),
                          LocalServicesPage(),
                          Settings(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
