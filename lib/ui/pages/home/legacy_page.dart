import 'package:flutter/material.dart';
import 'package:fungi_app/ui/pages/home/data_tunnel_page.dart';
import 'package:fungi_app/ui/pages/home/drive_page.dart';

class LegacyPage extends StatelessWidget {
  const LegacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Legacy Tools', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 6),
        Text(
          'Old File Transfer and Data Tunnel UI stay here temporarily so the new tabs can focus on the new workflow.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text('File Transfer', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        const FileServer(),
        const SizedBox(height: 8),
        const RemoteFileAccess(),
        const SizedBox(height: 24),
        Text('Data Tunnel', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        const DataTunnelPage(),
      ],
    );
  }
}
