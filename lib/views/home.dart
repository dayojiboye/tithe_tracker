import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tithe_tracker/core/models/tithe.dart';
import 'package:tithe_tracker/core/tithe_provider.dart';
import 'package:tithe_tracker/utils/theme.dart';
import 'package:tithe_tracker/widgets/tithe_tile.dart';

class TitheHome extends StatefulHookConsumerWidget {
  const TitheHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TitheHomeState();
}

class _TitheHomeState extends ConsumerState<TitheHome> {
  @override
  void initState() {
    super.initState();
    ref.read(titheProvider).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final List<TitheModel> tithes = ref.watch(titheProvider).titheList;

    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        padding: const EdgeInsets.only(
          top: 72,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tithes",
              style: TextStyle(
                fontSize: 28,
                color: kTextPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tithes.length,
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  return TitheTile(
                    month: tithes[index].month,
                    isPaid: tithes[index].isPaid,
                    onTap: () =>
                        ref.read(titheProvider).updateList(tithes[index].month),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
