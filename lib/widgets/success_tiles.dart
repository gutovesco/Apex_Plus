import 'dart:math';

import 'package:apex_plus/pages/bloqueado.dart';
import 'package:apex_plus/pages/lista_trilha.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SuccessTimeline extends StatefulWidget {
  @override
  SuccessTimelineState createState() => SuccessTimelineState();
}

class SuccessTimelineState extends State<SuccessTimeline> {
  List<Step> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff),
            Color(0xFFfcfcfc),
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFFFCB69F).withOpacity(0.2),
        ),
        child: Scaffold(
          appBar: GradientAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text('Roadmap'),
              ],
            ),
//        centerTitle: true,
            gradient: LinearGradient(
                colors: [Colors.lightGreenAccent, Color(0xFF4dff4d)]),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                _Header(),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[_TimelineSteps(steps: _steps)],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Step> _generateData() {
    return <Step>[
      const Step(
        step: 1,
        title: 'Avaliação da capacidade exportadora',
        message: 'Nos ajude Yves',
      ),
      const Step(
        step: 2,
        title: 'Habilitação junto à receita federal e ao SECINT',
        message: 'Por favor',
      ),
      const Step(
        step: 3,
        title: 'Sobre os INCOTERMS',
        message: 'Precisamos desses textos',
      ),
      const Step(
        step: 4,
        title: 'Definição do preço de exportação',
        message: 'Pro app fazer sentido',
      ),
      const Step(
        step: 5,
        title: 'Sobre a licença de exportação',
        message: 'Queremos acabar isso logo',
      ),
      const Step(
        step: 6,
        title: 'Registrando a exportação',
        message: 'Ninguem aguenta mais',
      ),
      const Step(
        step: 7,
        title: 'Despacho aduaneiro e documentos fiscais',
        message: 'Oq acham de explodirmos a apex?',
      ),
    ];
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isOdd)
            return const TimelineDivider(
              color: Color(0xFF1ba019),
              thickness: 5,
              begin: 0.1,
              end: 0.9,
            );

          final int itemIndex = index ~/ 2;
          final Step step = steps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: step.title,
            subtitle: step.message,
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == steps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

          return TimelineTile(
            alignment: TimelineAlign.manual,
            rightChild: isLeftAlign ? child : null,
            leftChild: isLeftAlign ? null : child,
            lineX: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicatorY: indicatorY,
              indicator: _TimelineStepIndicator(step: '${step.step}'),
            ),
            topLineStyle: const LineStyle(
              color: Color(0xFF1ba019),
              width: 5,
            ),
          );
        },
        childCount: max(0, steps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key key, this.step}) : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1ba019),
      ),
      child: Center(
        child: Text(
          step,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key key,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
            isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.acme(
              fontSize: 22,
              color: const Color(0xFF57C84D),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.robotoSlab(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13),
            child: Container(
              width: 120.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  if (title == 'Avaliação da capacidade exportadora') {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ListTrilhaPage()));
                  } else {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Bloqueado()));
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff41ea5d), Color(0xffb5f2bf)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Começar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      'Trilha do exportador',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class Step {
  const Step({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;
}
