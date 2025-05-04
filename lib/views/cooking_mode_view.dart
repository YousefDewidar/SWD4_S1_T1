import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';

class CookingModeView extends StatefulWidget {
  final List<String> steps;
  final String recipeName;
  final String imageUrl;
  final String preparationTime;
  final String cookTime;

  const CookingModeView({
    super.key,
    required this.steps,
    required this.recipeName,
    required this.imageUrl,
    required this.preparationTime,
    required this.cookTime,
  });

  @override
  State<CookingModeView> createState() => _CookingModeViewState();
}

class _CookingModeViewState extends State<CookingModeView> {
  int currentStep = 0;
  final FlutterTts tts = FlutterTts();
  bool isMuted = false;
  int? remainingSeconds;
  Timer? countdownTimer;
  bool isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    speakStep();
  }

  @override
  void dispose() {
    log("message");
    countdownTimer?.cancel();
    tts.stop();
    super.dispose();
  }

  Future<void> speakStep() async {
    if (isMuted) return;
    await tts.setLanguage("en-US");
    await tts.setPitch(1.1);
    await tts.speak(widget.steps[currentStep]);
  }

  void nextStep() {
    if (currentStep < widget.steps.length - 1) {
      setState(() {
        currentStep++;
      });
      speakStep();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      speakStep();
    }
  }

  void startTimer(int minutes) {
    countdownTimer?.cancel();
    setState(() {
      remainingSeconds = minutes * 60;
      isTimerRunning = true;
    });

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds == null || remainingSeconds! <= 0) {
        timer.cancel();
        setState(() => isTimerRunning = false);
        playAlarm();
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text('Time\'s up!'),
                content: Text('The timer has finished.'),
                actions: [
                  TextButton(
                    onPressed:
                        () => Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
      } else {
        setState(() => remainingSeconds = remainingSeconds! - 1);
      }
    });
  }

  void playAlarm() {
    tts.speak("Time's up! Check your food.");
  }

  void showTimePickerSheet() {
    int selectedMinutes = int.parse(widget.preparationTime);
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade900
              : Colors.white,
      builder: (context) {
        return SizedBox(
          height: 320,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Select Timer Duration',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedMinutes - 1,
                  ),
                  onSelectedItemChanged: (index) {
                    selectedMinutes = index + 1;
                  },
                  children: List.generate(
                    60,
                    (index) => Center(child: Text('${index + 1} minutes')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    startTimer(selectedMinutes);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade300,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Start Timer'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                widget.imageUrl,
                maxWidth: 60,
                maxHeight: 60,
              ),
              radius: 19,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.recipeName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
            onPressed: () {
              setState(() {
                isMuted = !isMuted;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Step indicator
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.timer_outlined, color: Colors.amber),
                    Text(
                      'Prep: ${widget.preparationTime} min',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Step ${currentStep + 1} of ${widget.steps.length}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.restaurant_outlined, color: Colors.greenAccent),
                    Text(
                      'Cook: ${widget.cookTime} min',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton.icon(
              icon: Icon(Icons.timer, size: 20),
              label: Text(
                isTimerRunning
                    ? '${(remainingSeconds! ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds! % 60).toString().padLeft(2, '0')}'
                    : 'Set Timer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isTimerRunning
                        ? Colors.amber.shade300
                        : Colors.pink.shade400,
                foregroundColor: isTimerRunning ? Colors.black87 : Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              onPressed: showTimePickerSheet,
            ),
          ),

          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Lottie.asset(
                    "assets/cook_mode_animation.json",
                    width: 250,
                    height: 250,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      widget.steps[currentStep],
                      key: ValueKey(currentStep),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade300,
                          foregroundColor: Colors.black87,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        onPressed:
                            currentStep < widget.steps.length - 1
                                ? nextStep
                                : () => Navigator.of(
                                  context,
                                ).popUntil((route) => route.isFirst),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              currentStep < widget.steps.length - 1
                                  ? 'Next Step'
                                  : 'Go to Home',
                            ),
                            SizedBox(width: 8),
                            Icon(
                              currentStep < widget.steps.length - 1
                                  ? Icons.arrow_forward_ios_rounded
                                  : Icons.home,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade400,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        onPressed: currentStep > 0 ? prevStep : null,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios_new_rounded),
                            SizedBox(width: 8),
                            Text('Previous Step'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
