import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ScreensaverOverlay extends StatelessWidget {
  final String? backdropUrl;
  final String? logoUrl;
  final String title;
  final String? episodeLabel;
  final String Function(String?, {String size}) optimizeTmdbUrl;

  const ScreensaverOverlay({
    super.key,
    this.backdropUrl,
    this.logoUrl,
    required this.title,
    this.episodeLabel,
    required this.optimizeTmdbUrl,
  });

  /// Ancho máximo que puede ocupar el logo (evita que se estire por toda la pantalla)
  static const double _maxLogoWidth = 320;
  static const double _maxLogoWidthEpisode = 260;

  @override
  Widget build(BuildContext context) {
    final backdrop = optimizeTmdbUrl(backdropUrl, size: 'w780');
    final logo = optimizeTmdbUrl(logoUrl, size: 'w300');
    final isEpisode = episodeLabel != null && episodeLabel!.isNotEmpty;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (backdrop.isNotEmpty)
          CachedNetworkImage(
            imageUrl: backdrop,
            fit: BoxFit.cover,
            memCacheWidth: 960,
            placeholder: (_, __) => const ColoredBox(color: Colors.black),
            errorWidget: (_, __, ___) => const ColoredBox(color: Colors.black),
          )
        else
          const ColoredBox(color: Colors.black),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black,
                  Colors.black.withValues(alpha: 0.85),
                  Colors.black.withValues(alpha: 0.35),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.25, 0.55, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          left: 36,
          bottom: 40,
          child: isEpisode
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLogo(
                      logo: logo,
                      title: title,
                      maxWidth: _maxLogoWidthEpisode,
                      height: 56,
                      textSize: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      episodeLabel!,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                )
              : _buildLogo(
                  logo: logo,
                  title: title,
                  maxWidth: _maxLogoWidth,
                  height: 64,
                  textSize: 28,
                ),
        ),
      ],
    );
  }

  /// Construye el logo con ancho máximo y altura fija, sin deformar.
  /// Si falla o no hay logo, muestra el título en texto.
  Widget _buildLogo({
    required String logo,
    required String title,
    required double maxWidth,
    required double height,
    required double textSize,
  }) {
    final fallback = Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.white,
        fontSize: textSize,
        fontWeight: FontWeight.w800,
      ),
    );

    if (logo.isEmpty) return fallback;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: height,
      ),
      child: CachedNetworkImage(
        imageUrl: logo,
        height: height,
        fit: BoxFit.contain,
        alignment: Alignment.centerLeft,
        memCacheHeight: (height * 2).round(),
        errorWidget: (_, __, ___) => fallback,
      ),
    );
  }
}