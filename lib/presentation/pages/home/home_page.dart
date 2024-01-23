import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheather/application/home/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      body: state.isLoading
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.weather?.forecast?.forecastday?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          ref.read(homeProvider.notifier).change(index);
                        },
                        child: Column(
                          children: [
                            Text(
                                "H:${state.weather?.forecast?.forecastday?[index].day?.maxtempC.toString().split('.').first ?? " "}° "),
                            Text(
                                "L:${state.weather?.forecast?.forecastday?[index].day?.mintempC.toString().split('.').first ?? " "}° "),
                            state.selectIndex == index
                                ? const Icon(Icons.construction)
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
