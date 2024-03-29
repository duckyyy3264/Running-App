import 'package:flutter/material.dart';
import 'package:running_app/utils/common_widgets/app_bar.dart';
import 'package:running_app/utils/common_widgets/header.dart';
import 'package:running_app/utils/common_widgets/input_decoration.dart';
import 'package:running_app/utils/common_widgets/main_button.dart';
import 'package:running_app/utils/common_widgets/main_wrapper.dart';
import 'package:running_app/utils/common_widgets/default_background_layout.dart';
import 'package:running_app/utils/common_widgets/text_button.dart';
import 'package:running_app/utils/common_widgets/text_form_field.dart';
import 'package:running_app/utils/common_widgets/wrapper.dart';
import 'package:running_app/utils/constants.dart';

class ProfileCreateView extends StatefulWidget {
  const ProfileCreateView({super.key});

  @override
  State<ProfileCreateView> createState() => _ProfileCreateViewState();
}

class _ProfileCreateViewState extends State<ProfileCreateView> {
  String? gender = "male";
  String selectedValue = "";

  List fields = [
    {
      "hintText": "Name",
      "initialValue": "Dang Minh Duc",
    },
    {
      "hintText": "Email",
      "initialValue": "duc@gmail.com",
    },
    {
      "hintText": "Nation",
      "initialValue": "Viet Nam",
    },
    {
      "hintText": "City",
      "initialValue": "Ninh Binh",
    },
    {
      "hintText": "Birthday",
      "initialValue": "26/10/2003",
    },
    {
      "hintText": "Height (cm)",
      "initialValue": "168",
    },
    {
      "hintText": "Weight (kg)",
      "initialValue": "67",
    },
    {
      "hintText": "Phone number",
      "initialValue": "0858189821",
    },
    {
      "hintText": "Address",
      "initialValue": "Ninh Binh - Nho Quan",
    },
    {
      "hintText": "Shoe size",
      "initialValue": "42",
    },
    {
      "hintText": "Shirt size",
      "initialValue": "L",
    },
    {
      "hintText": "Trouser size",
      "initialValue": "XL",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: const Header(title: "Create your own profile", noIcon: true,),
        backgroundImage: TImage.PRIMARY_BACKGROUND_IMAGE,
      ),
      body: SingleChildScrollView(
        child: DefaultBackgroundLayout(
          child: Stack(
            children: [
              MainWrapper(
                child: Column(
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/img/community/ptit_logo.png",
                                width: 100,
                                height: 100,
                              )
                          ),
                          const SizedBox(
                            height: 120,
                            width: 100,
                          ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: TColor.PRIMARY
                              ),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: TColor.PRIMARY_TEXT,
                                size: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: media.height * 0.015,),

                    // Information
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Information",
                          style: TextStyle(
                              color: TColor.PRIMARY_TEXT,
                              fontSize: FontSize.LARGE,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: media.height * 0.02),
                        Column(
                          children: [
                            for(int i = 0; i < 2; i++)...[
                              CustomTextFormField(
                                // initialValue: fields[i]["initialValue"],
                                decoration: CustomInputDecoration(
                                  // hintText: fields[i]["hintText"],
                                  label: Text(
                                    fields[i]["hintText"],
                                    style: TextStyle(
                                      color: TColor.DESCRIPTION,
                                      fontSize: FontSize.NORMAL,
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(height: media.height * 0.015,)
                            ],
                            for(int i = 2; i < 4; i++)...[
                              SizedBox(
                                height: 60,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  // value: selectedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      // selectedValue = newValue;
                                    });
                                  },
                                  items: [
                                    for(int i = 0; i < 5; i++)
                                      DropdownMenuItem(
                                        value: "Option $i",
                                        child: Text(
                                          "Option $i",
                                          style: TextStyle(
                                            color: TColor.PRIMARY_TEXT,
                                            fontSize: FontSize.SMALL,
                                          ),
                                        ),
                                      ),
                                  ],
                                  decoration: CustomInputDecoration(
                                      hintText: fields[i]["hintText"]
                                  ),
                                  dropdownColor: Colors.black,

                                ),
                              ),
                              SizedBox(height: media.height * 0.015,),
                            ]
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: media.height * 0.02,),

                    // Health Information
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Health Information",
                          style: TextStyle(
                              color: TColor.PRIMARY_TEXT,
                              fontSize: FontSize.LARGE,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: media.height * 0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for(var x in ["male", "female"])...[
                              Container(
                                height: 50,
                                width: media.width * 0.46,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: TColor.BORDER_COLOR,
                                        width: 2
                                    )
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: x,
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                      fillColor: MaterialStateProperty.all<Color>(
                                        const Color(0xffcdcdcd),
                                      ),
                                    ),
                                    Text(
                                      x[0].toUpperCase() + x.substring(1),
                                      style: const TextStyle(
                                          color: Color(0xffcdcdcd),
                                          fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          ],
                        ),
                        SizedBox(height: media.height * 0.015,),
                        CustomTextFormField(
                          // initialValue: fields[4]["initialValue"],
                          decoration: CustomInputDecoration(
                            label: Text(
                              fields[4]["hintText"],
                              style: TextStyle(
                                color: TColor.DESCRIPTION,
                                fontSize: FontSize.NORMAL,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: media.height * 0.015,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: media.width * 0.46,
                              child: CustomTextFormField(
                                // initialValue: fields[5]["initialValue"],
                                decoration: CustomInputDecoration(
                                  // hintText: fields[5]["hintText"],
                                    label: Text(
                                      fields[5]["hintText"],
                                      style: TextStyle(
                                        color: TColor.DESCRIPTION,
                                        fontSize: FontSize.NORMAL,
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            SizedBox(
                              width: media.width * 0.46,
                              child: CustomTextFormField(
                                // initialValue: fields[6]["initialValue"],
                                decoration: CustomInputDecoration(
                                  // hintText: fields[6]["hintText"],
                                    label: Text(
                                      fields[6]["hintText"],
                                      style: TextStyle(
                                        color: TColor.DESCRIPTION,
                                        fontSize: FontSize.NORMAL,
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.02,),

                    // Additional information
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Additional Information",
                          style: TextStyle(
                              color: TColor.PRIMARY_TEXT,
                              fontSize: FontSize.LARGE,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: media.height * 0.02,),
                        for(int i = 7; i < 10; i++)...[
                          CustomTextFormField(
                            // initialValue: fields[i]["initialValue"],
                            decoration: CustomInputDecoration(
                              // hintText: fields[i]["hintText"],
                                label: Text(
                                  fields[i]["hintText"],
                                  style: TextStyle(
                                    color: TColor.DESCRIPTION,
                                    fontSize: FontSize.NORMAL,
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: media.height * 0.015,),
                        ],
                        for(int i = 10; i < 12; i++)...[
                          SizedBox(
                            height: 60,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              // value: selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  // selectedValue = newValue;
                                });
                              },
                              items: [
                                for(int i = 0; i < 5; i++)
                                  DropdownMenuItem(
                                    value: "Option $i",
                                    child: Text(
                                      "Option $i",
                                      style: TextStyle(
                                        color: TColor.PRIMARY_TEXT,
                                        fontSize: FontSize.SMALL,
                                      ),
                                    ),
                                  ),
                              ],
                              decoration: CustomInputDecoration(
                                  hintText: fields[i]["hintText"]
                              ),
                              dropdownColor: Colors.black,
                            ),
                          ),
                          if(i < 1) SizedBox(height: media.height * 0.02,),
                        ]
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrapper(
          child: Container(
            margin: EdgeInsets.fromLTRB(media.width * 0.025, 15, media.width * 0.025, media.width * 0.025),
            child: CustomMainButton(
              horizontalPadding: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                "Create club",
                style: TextStyle(
                    color: TColor.PRIMARY_TEXT,
                    fontSize: FontSize.LARGE,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
          )
      ),
    );
  }
}
