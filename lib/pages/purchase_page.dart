import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  Widget _buildButtonText() {
    return _purchasePending
        ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.5,
            ),
          )
        : const Text('Place order');
  }

  bool _purchasePending = false;
  Widget _buildBuyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            _purchasePending = true;
          });
          await Future.delayed(const Duration(milliseconds: 2000));
          setState(() {
            _purchasePending = false;
          });
          // ignore: use_build_context_synchronously
          context.read<AppCubit>().updateIsPremium(true);
        },
        child: _buildButtonText(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<AppCubit>().state.isPremium
                ? 'WOW such premium!'
                : 'Are you premium?',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          context.watch<AppCubit>().state.isPremium
              ? const Icon(Icons.check_circle, size: 64, color: Colors.green)
              : const Icon(Icons.close, size: 64, color: Colors.red),
          const SizedBox(height: 40),
          if (!context.watch<AppCubit>().state.isPremium) _buildBuyButton(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premium')),
      body: _buildBody(),
    );
  }
}
