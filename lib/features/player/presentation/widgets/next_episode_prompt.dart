import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextEpisodePrompt extends StatelessWidget {
  final String? thumbnailUrl;
  final String titleLine;
  final String subtitleLine;
  final String countdownText;
  final bool isTv;
  final FocusNode focusNode;
  final VoidCallback onPlay;
  final VoidCallback onDismiss;
  /// Baja el foco a la barra de progreso (como "Omitir intro"). No cierra el prompt.
  final VoidCallback? onNavigateDown;
  final Color accentColor;
  final String Function(String?, {String size}) optimizeTmdbUrl;

  const NextEpisodePrompt({
    super.key,
    this.thumbnailUrl,
    required this.titleLine,
    required this.subtitleLine,
    required this.countdownText,
    required this.isTv,
    required this.focusNode,
    required this.onPlay,
    required this.onDismiss,
    this.onNavigateDown,
    required this.accentColor,
    required this.optimizeTmdbUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.select ||
              event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.space) {
            onPlay();
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.escape ||
              event.logicalKey == LogicalKeyboardKey.goBack ||
              event.logicalKey == LogicalKeyboardKey.browserBack) {
            onDismiss();
            return KeyEventResult.handled;
          }
          // ↓ igual que "Omitir intro": mover foco abajo SIN cerrar el prompt
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            if (onNavigateDown != null) {
              onNavigateDown!();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            // No cerrar al subir
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
              event.logicalKey == LogicalKeyboardKey.arrowRight) {
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            constraints: const BoxConstraints(maxWidth: 280),
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xE6121212),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasFocus
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.2),
                width: hasFocus ? 1.8 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: onPlay,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 8, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isTv ? 'Siguiente episodio' : 'Siguiente',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              titleLine,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: hasFocus
                              ? Colors.white
                              : accentColor.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: hasFocus ? Colors.black : Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}