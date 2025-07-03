import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int selectedTab = 0; // 0: My Events, 1: All Events

  final List<Map<String, String>> events = [
    {
      'logo': 'assets/images/stocks/bmw.png',
      'title': 'BMW AG',
      'desc': 'Ex-Dividend for May',
      'date': '1 May',
    },
    {
      'logo': 'assets/images/stocks/apple.png',
      'title': 'Apple INC',
      'desc': 'Dividend - 196.43\$ per share',
      'date': '2 May',
    },
    {
      'logo': 'assets/images/stocks/master.png',
      'title': 'MasterCard',
      'desc': 'Dividend - 0.76\$ per share',
      'date': '4 May',
    },
    {
      'logo': 'assets/images/stocks/audi.png',
      'title': 'Audi AG',
      'desc': 'Ex-Dividend for May',
      'date': '4 May',
    },
    {
      'logo': 'assets/images/stocks/coca.png',
      'title': 'Coca-Cola',
      'desc': 'Earning calls',
      'date': '5 May',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF1C1F26) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Tab switcher
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabButton("My Events", 0),
                  _buildTabButton("All events", 1),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Event list
            Expanded(
              child: ListView.separated(
                itemCount: events.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final e = events[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[850] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            e['logo']!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                e['desc']!,
                                style: TextStyle(
                                  color:
                                      isDark
                                          ? Colors.grey[300]
                                          : Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(e['date']!, style: TextStyle(color: textColor)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final isSelected = selectedTab == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? (isDark ? Colors.blue[400] : Colors.white)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:
                    isSelected
                        ? (isDark ? Colors.white : Colors.black)
                        : (isDark ? Colors.grey[300] : Colors.grey[700]),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
