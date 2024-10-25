import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/button.dart';
import 'package:ios_calculator/Widgets/provider.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Result res, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0), // Right padding of 16.0
                    child: Flexible(
                      child: AutoSizeText(
                        res.res,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 100,
                        ),
                        maxLines: 2,
                        maxFontSize: 100,
                        minFontSize: 10,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),

              ///////First ROW//////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CreateButton("AC", Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.surface),
                  CreateButton("+/-", Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.surface),
                  CreateButton("%", Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.surface),
                  CreateButton("÷", Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onSurface),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ///////second ROW//////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CreateButton("7", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("8", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("9", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("x", Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onSurface),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ///////third ROW//////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CreateButton("4", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("5", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("6", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("-", Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onSurface),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ///////fourth ROW//////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CreateButton("1", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("2", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("3", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("+", Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onSurface),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CreateButton(
                    "0",
                    Theme.of(context).colorScheme.onSecondary,
                    Theme.of(context).colorScheme.onSurface,
                    width: 150,
                    height: 75,
                  ),
                  CreateButton(".", Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.onSurface),
                  CreateButton("=", Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onSurface),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
