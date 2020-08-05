import 'dart:math';

import 'package:apex_plus/pages/bloqueado.dart';
import 'package:apex_plus/pages/conteudos/list_trilha_two.dart';
import 'package:apex_plus/pages/conteudos/list_trilha_three.dart';
import 'package:apex_plus/pages/conteudos/list_trilha_one.dart';
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
                Text('Roadmap',
                    style: GoogleFonts.robotoSlab(color: Colors.white)),
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
        title: 'Avaliação da Capacidade Exportadora',
        message:
            'Neste módulo vamos verificar os principais aspectos acerca da capacidade exportadora de um negócio e suas implicações.',
      ),
      const Step(
        step: 2,
        title: 'Sobre os INCOTERMS',
        message:
            'Os INCOTERMS formam uma parcela importante dos contratos! Juntos vamos aprender sobre eles neste módulo!',
      ),
      const Step(
        step: 3,
        title: 'Classificação da Mercadoria e Mercados',
        message:
            'O mercado internacional possui uma “linguagem” própria para identificar as mercadorias. Vem com a gente aprender a classificar seu produto!',
      ),
      const Step(
        step: 4,
        title: 'A Importância do "Fit" Cultural',
        message:
            'Chegou o momento de entender este aspecto fundamental e interessante dos negócios internacionais!',
      ),
      const Step(
        step: 5,
        title: 'Habilitação junto à Receita Federal e ao SISCOMEX',
        message:
            'Fundamental para a viabilidade de qualquer processo de exportação, a habilitação deve ser bem compreendida! Vamos lá?',
      ),
      const Step(
        step: 6,
        title: 'Definição do Preço de Exportação',
        message:
            'Pode ser que você já saiba definir os preços para o seu produto no mercado interno... Agora chegou a hora de aprender como fazê-lo para o mercado externo!',
      ),
      const Step(
        step: 7,
        title:
            'Sobre a Licença de Exportação, Registro, Despacho Aduaneiro e Documentos Fiscais',
        message:
            'Neste módulo a gente te ajuda a aprender os principais conceitos para colocar a documentação em ordem!',
      ),
      const Step(
        step: 8,
        title: 'Transporte Internacional',
        message:
            'Como fazer o produto chegar ao seu destino e fazer muitas felizes? Vem com a gente aprender!',
      ),
      const Step(
        step: 9,
        title: 'Conhecendo a Apex e Conquistando o Mundo!',
        message:
            'Parabéns! Agora você possui conhecimentos importantes, veja como a Apex e nosso Conteúdo Premium podem te ajudar à ir ainda mais longe!',
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
            id: step.step.toInt(),
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
    this.id,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final int id;
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
                  if (id <= 3) {
                    var route;
                    switch (id) {
                      case 1:
                        route = ListTrilhaOne();
                        break;
                      case 2:
                        route = ListTrilhaTwo();
                        break;
                      case 3:
                        route = ListTrilhaThree();
                        break;
                      default:
                        route = ListTrilhaOne();
                    }
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => route));
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
                        colors: [
                          id > 3 ? Colors.grey[700] : Color(0xff41ea5d),
                          id > 3 ? Colors.grey : Color(0xffb5f2bf)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      id > 3 ? "Bloqueado" : "Começar",
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
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      'Trilha do exportador',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoSlab(
                        fontSize: 22,
                        color: Colors.black,
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
