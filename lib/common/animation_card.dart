import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

import 'load_url.dart';

class AnimationCard extends StatefulWidget {
  const AnimationCard(
      {super.key,
        required this.child,
        required this.text,
        required this.dimens,
        required this.url});

  final String url;
  final BoxConstraints dimens;
  final Widget child;
  final String text;

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController scaleAnimationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    scaleAnimation = Tween(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => scaleAnimationController.forward(),
      onPointerUp: (_) => scaleAnimationController.reverse(),
      onPointerCancel: (_) => scaleAnimationController.reverse(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => scaleAnimationController.forward(),
        onExit: (_) => scaleAnimationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          alignment: Alignment.center,
          filterQuality: FilterQuality.high,
          child: GestureDetector(
            onTap: () => _showDialog(context),
            // Tilt here
            child: Tilt(
              borderRadius: BorderRadius.circular(20),
              tiltConfig: const TiltConfig(filterQuality: FilterQuality.high),
              lightConfig: const LightConfig(
                minIntensity: 0.1,
                maxIntensity: 0.4,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Align(
            child: Transform.scale(
              scale: 1.2,
              filterQuality: FilterQuality.high,
              // Tilt here
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Tilt(
                    borderRadius: BorderRadius.circular(20),
                    tiltConfig: const TiltConfig(
                      enableRevert: false,
                      enableSensorRevert: false,
                      filterQuality: FilterQuality.high,
                    ),
                    lightConfig: const LightConfig(
                      minIntensity: 0.1,
                      maxIntensity: 0.4,
                    ),
                    shadowConfig: const ShadowConfig(disable: true),
                    child: widget.child,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        onLongPress: () {},
                        onPressed: () {
                          LaunchFile.launchUrl(widget.url);
                        },
                        icon: const Icon(Icons.book_online_sharp),
                        label: const Text('See This Book on Amazon')),
                  ),
                  SizedBox(
                      width: widget.dimens.maxWidth / 2,
                      height: widget.dimens.maxHeight / 3,
                      child: SingleChildScrollView(
                          child: Text(
                            widget.text,
                            style: const TextStyle(color: Colors.white54),
                          )))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
