import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';

class ExtDatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    10.forEach((index) {
      // do something...
    });
    return Scaffold(
      appBar: AppBar(
        title: 'ExtDatePage'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1 : STRING TO DATE
          ExAccordion(
            showAccordion: true,
            title: 'STRING TO DATE',
            content: Container(
              child: VStack(
                [
                  '${'23-04-1999'.toDateEx(format: 'dd-MM-yyyy')}'.text.make(),
                  '${'12-12-2010 08:40:12'.toDateEx(format: 'dd-MM-yyyy mm:HH:ss')}'
                      .text
                      .make(),
                  '${'21-09-2029'.toDateEx(format: 'dd-MM-yyyy')}'.text.make(),
                  '${'01/11/2011'.toDateEx(format: 'dd/MM/yyyy')}'.text.make(),
                ],
              ),
            ),
          ),

          /// 2 : REFORMAT DATE -> String -> Date -> String
          ExAccordion(
            showAccordion: true,
            title: 'REFORMAT DATE',
            content: Container(
              child: VStack(
                [
                  '${'23-04-1995'.reformatDate(from: 'dd-MM-yyyy')}'
                      .text
                      .make(),
                  '${'12-12-2010 08:40:12'.reformatDate(from: 'dd-MM-yyyy mm:HH:ss', to: 'HH:mm')}'
                      .text
                      .make(),
                  '${'21-09-2029'.reformatDate(from: 'dd-MM-yyyy', to: 'dd MMMM yyyy')}'
                      .text
                      .make(),
                  '${'01/11/2011'.reformatDate(from: 'dd/MM/yyyy', to: 'dd MMM')}'
                      .text
                      .make(),
                ],
              ),
            ),
          ),

          /// 3 : DATE TO STRING
          ExAccordion(
            showAccordion: true,
            title: 'DATE TO STRING',
            content: Container(
              child: VStack(
                [
                  '${DateTime.now().toStringEx(format: 'd/M/y', locale: 'en')}'
                      .text
                      .make(),
                  '${DateTime.now().toStringEx(format: 'EEEE, dd MMMM yyyy', locale: 'in')}'
                      .text
                      .make(),
                  '${DateTime.now().toStringEx(format: 'EEEE, MMMM dd, yyyy', locale: 'en')}'
                      .text
                      .make(),
                  '${DateTime.now().toStringEx(format: 'd MMM yy', locale: 'en')}'
                      .text
                      .make(),
                  '${DateTime.now().toStringEx(format: 'dd MMMM yyyy | HH:mm:ss', locale: 'in')}'
                      .text
                      .make(),
                ],
              ),
            ),
          ),

          /// 4 : INT TO DATE (fromMillisecondsSinceEpoch)
          ExAccordion(
            showAccordion: true,
            title: 'INT TO DATE (fromMillisecondsSinceEpoch)',
            content: Container(
              child: VStack(
                [
                  '${1640979000000.fromMillisecondsSinceEpoch()}'.text.make(),
                  '${1640979000000.fromMillisecondsSinceEpoch()?.toStringEx(format: 'dd MMM yyyy')}'
                      .text
                      .make(),
                ],
              ),
            ),
          ),

          /// 5 : timesAgo (on Date)
          ExAccordion(
            showAccordion: true,
            title: 'ago (Date)',
            content: Container(
              child: VStack(
                [
                  '${DateTime.now().ago()}'.text.make(),
                  '${DateTime.now().subtract(4.minutes).ago()}'.text.make(),
                  '${DateTime.now().subtract(3.hours).ago()}'.text.make(),
                  '${DateTime.now().subtract(1.days).ago()}'.text.make(),
                  '${DateTime.now().subtract(32.days).ago()}'.text.make(),
                  '${DateTime.now().subtract(766.days).ago()}'.text.make(),
                ],
              ),
            ),
          ),

          /// 6 : timesAgo (on String)
          ExAccordion(
            showAccordion: true,
            title: 'ago (String)',
            content: Container(
              child: VStack(
                [
                  '${'1995-04-24T12:34:56'.ago()}'.text.make(),
                  '${'21-10-2023 05:33'.ago(format: 'dd-MM-yyyy HH:mm')}'
                      .text
                      .make(),
                  '${'23-04-2000'.ago(format: 'dd-MM-yyyy')}'.text.make(),
                  '${'23/04/2005'.ago(format: 'dd/MM/yyyy')}'.text.make(),
                ],
              ),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
