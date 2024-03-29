import 'dart:math';

import 'package:flutter/material.dart';
import 'package:running_app/utils/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final fontWeight;

  const CustomText({this.fontSize, this.fontWeight, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: TColor.PRIMARY_TEXT,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight),
      // overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
class AthleteTable extends StatelessWidget {
  final Random random = Random();
  final double? tableHeight;
  final List<dynamic>? participants;
  final ScrollController? controller;

  AthleteTable({this.controller, this.tableHeight, this.participants, super.key});

  // Generate random data for demonstration
  String generateRandomName() {
    List<String> names = [
      'John Doe',
      'Alice Smith',
      'Michael Johnson',
      'Emily Brown',
      'David Lee',
      'Sophia Garcia',
      'John Doe',
      'Alice Smith',
      'Michael Johnson',
      'Emily Brown',
      'David Lee',
      'Sophia Garcia',
      'John Doe',
      'Alice Smith',
      'Michael Johnson',
      'Emily Brown',
      'David Lee',
      'Sophia Garcia',
      'John Doe',
      'Alice Smith',
      'Michael Johnson',
      'Emily Brown',
      'David Lee',
      'Sophia Garcia'
    ];
    return names[random.nextInt(names.length)];
  }

  String generateRandomDistance() {
    return (random.nextDouble() * 100)
        .toStringAsFixed(2);
  }

  String generateRandomTime() {
    int hours = random.nextInt(24);
    int minutes = random.nextInt(60);
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            bottom: 8
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: media.width * 0.1,
                      child: const CustomText(fontWeight: FontWeight.w700, text: 'Rank'),
                  ),
                  SizedBox(width: media.width * 0.02,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: media.width * 0.35,
                    child: const CustomText(fontWeight: FontWeight.w700, text: 'Athlete name'),
                  )
              ]),
              Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: media.width * 0.2,
                      child: const CustomText(fontWeight: FontWeight.w700, text: 'Total (km)'),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: media.width * 0.15,
                      child: const CustomText(fontWeight: FontWeight.w700, text: 'Time'),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: tableHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // for(int i = 0; i < 100; i++)
                for(var participant in participants ?? [])...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xff746cb3))
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: media.width * 0.05,
                              child: CustomText(text: (participants!.indexOf(participant) + 1).toString())
                            ),
                            SizedBox(width: media.width * 0.02,),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: media.width * 0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "assets/img/community/ptit_logo.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  SizedBox(width: media.width * 0.02,),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: media.width * 0.25,
                                        child: CustomText(
                                          text: participant?.username,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: media.width * 0.15,
                              child: CustomText(text: generateRandomDistance())
                            ),
                            // SizedBox(width: media.width * 0.1,),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: media.width * 0.15,
                              child: CustomText(text: '${generateRandomTime().split(":")[0]}h${generateRandomTime().split(":")[1]}m')
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]
                // DataTable(
                //     border: const TableBorder(
                //         horizontalInside: BorderSide(width: 2, color: Color(0xff746cb3))
                //     ),
                //     columnSpacing: 12, horizontalMargin: 0,
                //     columns: [
                //       DataColumn(
                //     label: Container(
                //       alignment: Alignment.centerLeft,
                //       child: const CustomText(text: '1'),
                //     ),
                //     numeric: true,
                //     tooltip: 'Athlete Rank',
                //     onSort: (columnIndex, ascending) {
                //     },
                //   ),
                //   DataColumn(
                //     label: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         ClipRRect(
                //           borderRadius: BorderRadius.circular(50),
                //           child: Image.asset(
                //             "assets/img/community/ptit_logo.png",
                //             width: 30,
                //             height: 30,
                //           ),
                //         ),
                //         SizedBox(width: media.width * 0.02,),
                //         Container(
                //             alignment: Alignment.centerLeft,
                //             child: SizedBox(
                //               width: media.width * 0.25,
                //               child: CustomText(
                //                 text: "adadadadadasd",
                //               ),
                //             )
                //             ),
                //       ],
                //     ),
                //     numeric: false,
                //     tooltip: 'Athlete Name',
                //   ),
                //   DataColumn(
                //     label: Center(
                //       child: CustomText(text: '6.32'),
                //     ),
                //     numeric: true,
                //     tooltip: 'Total Distance',
                //   ),
                //   DataColumn(
                //     label: Center(
                //       child: CustomText(text: '4h11m'),
                //     ),
                //     numeric: true,
                //     tooltip: 'Athlete Time',
                //   ),
                // ],
                //     rows: [
                //
                //   for (var participant in participants ?? []) ...[
                //     DataRow(
                //         cells: [
                //           DataCell(
                //             Center(
                //               child: Container(
                //                   alignment: Alignment.center,
                //                   child: CustomText(text: (participants!.indexOf(participant) + 1).toString())),
                //             ),
                //           ),
                //           DataCell(
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                   borderRadius: BorderRadius.circular(50),
                //                   child: Image.asset(
                //                     "assets/img/community/ptit_logo.png",
                //                     width: 30,
                //                     height: 30,
                //                   ),
                //                 ),
                //                 SizedBox(width: media.width * 0.02,),
                //                 Container(
                //                     alignment: Alignment.centerLeft,
                //                     child: SizedBox(
                //                       width: media.width * 0.25,
                //                       child: CustomText(
                //                           text: participant?.username,
                //                       ),
                //                     )),
                //               ],
                //             ),
                //           ),
                //           DataCell(
                //             Center(
                //                 child: Container(
                //                   alignment: Alignment.centerLeft,
                //                   child: CustomText(text: generateRandomDistance()),
                //                 )),
                //           ),
                //           DataCell(Center(
                //               child: Container(
                //                 alignment: Alignment.centerLeft,
                //                 child: CustomText(text: '${generateRandomTime().split(":")[0]}h${generateRandomTime().split(":")[1]}m'),
                //               ))),
                //         ]),
                //   ]
                // ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}