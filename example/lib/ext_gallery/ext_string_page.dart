import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class ExtStringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    10.forEach((index) {
      // do something...
    });
    return Scaffold(
      appBar: AppBar(
        title: 'Extention on String'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          ExAccordion(
            showAccordion: true,
            title: 'formatter',
            content: Container(
              child: VStack(
                [
                  'firstWord : ${'Aditya Pratama'.firstWord}'.text.make(),
                  'lastWord : ${'Aditya Pratama'.lastWord}'.text.make(),
                  'initialName : ${'Aditya Pratama'.initialName}'.text.make(),
                  'capitalize : ${'Aditya Pratama'.capitalize}'.text.make(),
                  'countWords : ${'Aditya Pratama'.countWords}'.text.make(),
                  'toSlug : ${'Aditya Pratama'.toSlug}'.text.make(),
                  'toCamelCase : ${'Aditya Pratama'.toCamelCase}'.text.make(),
                  'toTitleCase : ${'Aditya Pratama'.toTitleCase}'.text.make(),
                ],
              ),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'is?',
            content: Container(
              child: VStack(
                [
                  'isIpv4 : ${'Aditya Pratama'.isIpv4}'.text.make(),
                  'isIpv6 : ${'Aditya Pratama'.isIpv6}'.text.make(),
                  'isUrl : ${'Aditya Pratama'.isUrl}'.text.make(),
                  'isDate : ${'Aditya Pratama'.isDate}'.text.make(),
                  'isMail : ${'Aditya Pratama'.isMail}'.text.make(),
                  'isMail : ${'Aditya Pratama'.isMail}'.text.make(),
                  'isNumber : ${'Aditya Pratama'.isNumber()}'.text.make(),
                  'isStrongPassword : ${'Aditya Pratama'.isStrongPassword}'.text.make(),
                ],
              ),
            ),
          ),

          /// 3
          ExAccordion(
            showAccordion: true,
            title: 'functional 1',
            content: Container(
              child: VStack(
                [
                  'onlyAlfabet : ${'Aditya Pratama'.onlyAlfabet}'.text.make(),
                  'onlyNumbers : ${'Aditya Pratama'.onlyNumbers}'.text.make(),
                  'removeLetters : ${'Aditya Pratama'.removeLetters}'.text.make(),
                  'charCount (a): ${'Aditya Pratama'.charCount('a')}'.text.make(),
                  'reverse : ${'Aditya Pratama'.reverse()}'.text.make(),
                  'first : ${'Aditya Pratama'.first(n: 4)}'.text.make(),
                  'last : ${'Aditya Pratama'.last(n: 4)}'.text.make(),
                  'readTime : ${'Aditya Pratama'.readTime()}'.text.make(),
                  'stripHtml : ${'Aditya Pratama'.stripHtml}'.text.make(),
                ],
              ),
            ),
          ),

          /// 4
          ExAccordion(
            showAccordion: true,
            title: 'functional 2',
            content: Container(
              child: VStack(
                [
                  'removeFirst : ${'Aditya Pratama'.removeFirst(3)}'.text.make(),
                  'removeLast : ${'Aditya Pratama'.removeLast(3)}'.text.make(),
                  'maxChars : ${'Aditya Pratama'.maxChars(4)}'.text.make(),
                  'truncate : ${'Aditya Pratama'.truncate(4)}'.text.make(),
                  'truncateMiddle : ${'Aditya Pratama'.truncateMiddle(4)}'.text.make(),
                  'trimAll : ${'Aditya Pratama'.trimAll}'.text.make(),
                ],
              ),
            ),
          ),

          /// 5
          ExAccordion(
            showAccordion: true,
            title: 'Regex',
            content: Container(
              child: VStack(
                [
                  'allAfter : ${'Aditya Pratama'.allAfter('tya')}'.text.make(),
                  'allBefore : ${'Aditya Pratama'.allBefore('tya')}'.text.make(),
                  'allBetween : ${'Aditya Pratama'.allBetween('Adi', 'tama')}'.text.make(),
                  'maxLength : ${'Aditya Pratama'.maxLength(4)}'.text.make(),
                  'maxWords : ${'Aditya Pratama'.maxWords(1)}'.text.make(),
                ],
              ),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
