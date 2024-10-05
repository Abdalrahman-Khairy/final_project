import 'package:final_project/pages/situation_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HorizontalSlider extends StatefulWidget {
  const HorizontalSlider({super.key});

  @override
  _HorizontalSliderState createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<Map<String, String>> items = [
    {
      "title": "Level 1",
      "image": "assets/images/level_1.jpg",
      "description":
          "Begin your journey in the Nile Delta, Egypt's lush gateway to the Mediterranean, rich in history and crucial to the environment. As an environmental hero, you'll uncover its importance, face its challenges, and learn how to safeguard this vital landscape.",
    },
    {
      "title": "LEVEL 2",
      "image": "assets/images/level_2.jpg",
      "description":
          "The American Mediterranean Sea is the combined waterbody of the Caribbean Sea and the Gulf of Mexico.",
    },
    {
      "title": "LEVEL 3",
      "image": "assets/images/level_3.jpg",
      "description":
          "Manatees are large, fully aquatic, mostly herbivorous marine mammals sometimes known as sea cows. There are three accepted living species of Trichechidae, representing three of the four living species in the order Sirenia.",
    },
    {
      "title": "LEVEL 4",
      "image": "assets/images/level_4.jpg",
      "description":
          "The Hawaiian monk seal is an endangered species of earless seal in the family Phocidae that is endemic to the Hawaiian Islands. The Hawaiian monk seal is one of two remaining monk seal species; the other is the Mediterranean monk seal.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      child: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildSliderItem(items[index], index);
        },
      ),
    );
  }

  Widget _buildSliderItem(Map<String, String> item, int index) {
    double scale = _currentPage == index ? 1.0 : 0.9;
    return TweenAnimationBuilder(
      tween: Tween(begin: scale, end: scale),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: item),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item['image']!,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (item['description'] != null)
                          const SizedBox(height: 8),
                        if (item['description'] != null)
                          Text(
                            item['description']!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class DetailScreen extends StatefulWidget {
  final Map<String, String> item;

  const DetailScreen({super.key, required this.item});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/3wes_final.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title']!),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 4,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    label: Text(
                      _controller.value.isPlaying ? 'Pause' : 'Play',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item['title']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.item['description'] ??
                            'No description available.',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SituationScreen(),
                  ),
                );
              },
              label: const Text(
                'Situations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class SituationsScreen extends StatelessWidget {
  final String title;

  const SituationsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situations for $title'),
      ),
      body: const Center(
        child: Text('Situations content goes here'),
      ),
    );
  }
}
