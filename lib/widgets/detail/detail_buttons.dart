// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailButtons extends StatelessWidget {
  const DetailButtons({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.websiteUrl,
    required this.shopName,
  });

  final double latitude;
  final double longitude;
  final String? websiteUrl;
  final String shopName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton.filledTonal(
          icon: const Icon(Icons.map_outlined),
          padding: const EdgeInsets.all(20),
          onPressed: () => _launchMapApp(context, latitude, longitude),
        ),
        if (websiteUrl != null)
          IconButton.filledTonal(
            icon: const Icon(Icons.travel_explore_outlined),
            padding: const EdgeInsets.all(20),
            onPressed: () => _launchURL(websiteUrl!),
          ),
        IconButton.filledTonal(
          icon: const Icon(Icons.search),
          padding: const EdgeInsets.all(20),
          onPressed: () => _launchGoogleSearch(shopName),
        ),
      ],
    );
  }

  Future<void> _launchMapApp(
    BuildContext context,
    double lat,
    double lng,
  ) async {
    final availableMaps = await MapLauncher.installedMaps;
    if (!context.mounted) {
      return;
    }

    if (availableMaps.isNotEmpty) {
      await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (final map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: Coords(lat, lng),
                        title: shopName,
                      ),
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      final url =
          'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        if (!context.mounted) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          // FIX: SnackBarにしたい時とExceptionを投げたい時の使い分けは明確にある？
          // Exceptionにしました。

          throw Exception('Map application is not available.'),
        );
      }
    }
  }

  Future<void> _launchURL(String urlString) async {
    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }
}

Future<void> _launchGoogleSearch(String shopName) async {
  final query = Uri.encodeComponent(shopName);
  final url = 'https://www.google.com/search?q=$query';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
