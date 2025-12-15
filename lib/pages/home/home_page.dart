import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_moon_web/core/extensions/context_extension.dart';
import 'package:vibe_moon_web/pages/home/home_page_vm.dart';

/// Home 화면
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final viewModel = ref.read(homePageViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibe Moon - Home'),
        backgroundColor: context.colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로딩 인디케이터
            if (state.isLoading)
              const CircularProgressIndicator()
            else ...[
              // 카운터 설명
              Text(
                '버튼을 눌러 카운터를 증가시키세요:',
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 16),

              // 카운터 값
              Text(
                '${state.counter}',
                style: context.textTheme.displayLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // 에러 메시지
              if (state.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(color: context.colorScheme.error),
                  ),
                ),

              // 버튼 그룹
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: viewModel.incrementCounter,
                    icon: const Icon(Icons.add),
                    label: const Text('증가'),
                  ),
                  ElevatedButton.icon(
                    onPressed: viewModel.decrementCounter,
                    icon: const Icon(Icons.remove),
                    label: const Text('감소'),
                  ),
                  ElevatedButton.icon(
                    onPressed: viewModel.resetCounter,
                    icon: const Icon(Icons.refresh),
                    label: const Text('초기화'),
                  ),
                  ElevatedButton.icon(
                    onPressed: viewModel.loadData,
                    icon: const Icon(Icons.download),
                    label: const Text('데이터 로드'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 반응형 정보
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '화면 정보',
                        style: context.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text('너비: ${context.screenWidth.toStringAsFixed(0)}px'),
                      Text('높이: ${context.screenHeight.toStringAsFixed(0)}px'),
                      Text(
                        '디바이스: ${context.isMobile ? "모바일" : context.isTablet ? "태블릿" : "데스크톱"}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: '증가',
        child: const Icon(Icons.add),
      ),
    );
  }
}

