import 'package:flutter/material.dart';

enum Change { day, month, week, hour, sixMonth }

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  double _progress = 0.69;
  double years = 122.412;

  void _resetValue() {
    setState(() {
      _progress = 0.0;
    });
  }

  void _changeYears({required Change change}) {
    double yearValue;
    switch (change) {
      case Change.day:
        {
          yearValue = (1 / 360);
        }
      case Change.month:
        {
          yearValue = 1 / 12;
        }
      case Change.week:
        {
          yearValue = 7 / 360;
        }
      case Change.hour:
        {
          yearValue = 1 / (360 * 24);
        }
      case Change.sixMonth:
        {
          yearValue = 6 / 12;
        }
    }
    setState(() {
      years += yearValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EmotiDebt"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Summary Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Summary:",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          "Distress Level:",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: SizedBox(
                            height: 25,
                            child: TweenAnimationBuilder(
                              duration: Duration(milliseconds: 300),
                              tween: Tween<double>(
                                begin: _progress,
                                end: _progress,
                              ),
                              builder: (context, value, child) {
                                return LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(12),
                                  value: value, // Example progress (70%)
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.red,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Balance:",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "- ${years.toStringAsFixed(3)} years",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Quick Actions Card
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quick Action:",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Defer Processing",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                          children: [
                            _QuickActionButton(
                              label: '1 Day',
                              onPressed: () => _changeYears(change: Change.day),
                            ),
                            _QuickActionButton(
                              label: '1 Week',
                              onPressed:
                                  () => _changeYears(change: Change.week),
                            ),
                            _QuickActionButton(
                              label: '1 Month',
                              onPressed:
                                  () => _changeYears(change: Change.month),
                            ),
                            _QuickActionButton(
                              label: '6 Month',
                              onPressed:
                                  () => _changeYears(change: Change.sixMonth),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "System Reset:",

                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _QuickActionButton(
                      label: 'Apply Now',
                      pad: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      onPressed: () => _resetValue(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsets? pad;

  const _QuickActionButton({
    required this.label,
    required this.onPressed,
    this.pad,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: onPressed,
      child: Container(
        padding: pad ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
