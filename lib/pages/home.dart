import 'package:flutter/material.dart';
import 'package:private_upload/auth/privateprovider.dart';
import 'package:private_upload/pages/sub/appbar_avatar.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _isHovering = -1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _price;
  String? _numberError;
  int? number;

  void _updateDefaultValue() {
    setState(() {
      number = int.tryParse(_price.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: const Text("PirateBay"),
        actions: const [AppbarAvatar()],
      ),
      body: Consumer<PrivateProvider>(builder: (context, state, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                    margin: const EdgeInsets.all(50.0),
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemCount:
                              state.itemone != null ? state.itemone!.length : 1,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Container(
                                  margin: const EdgeInsets.all(50.0),
                                  // color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                height: 200,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: state.itemone !=
                                                              null
                                                          ? NetworkImage(state
                                                              .itemone![0]
                                                              .imageurl!)
                                                          : const NetworkImage(
                                                              "")),
                                                )),
                                            Container(
                                              height: 200,
                                              width: 300,
                                              // margin: const EdgeInsets.only(left: 50.0),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) => ProductDisplay(
                                                      //             catImages: catImages,)));
                                                    },
                                                    onHover: (isHovering) {
                                                      setState(() {
                                                        _isHovering =
                                                            isHovering ? 0 : -1;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 75,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 10.0),
                                                      decoration: BoxDecoration(
                                                        color: 0 == _isHovering
                                                            ? const Color
                                                                    .fromARGB(
                                                                255,
                                                                225,
                                                                246,
                                                                255)
                                                            : const Color
                                                                    .fromARGB(
                                                                0, 201, 62, 62),
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              PrivateProvider
                                                                  state =
                                                                  Provider.of<
                                                                          PrivateProvider>(
                                                                      context,
                                                                      listen:
                                                                          false);
                                                              number = state
                                                                  .itemone![0]
                                                                  .bidderPrice;
                                                              _price = TextEditingController(
                                                                  text: number
                                                                      .toString());
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Enter Price'),
                                                                content: Form(
                                                                    key:
                                                                        _formKey,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        TextFormField(
                                                                          controller:
                                                                              _price,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          onChanged:
                                                                              (value) {
                                                                            int?
                                                                                newValue =
                                                                                int.tryParse(value);
                                                                            // Validate the entered value
                                                                            if (value.isEmpty) {
                                                                              setState(() {
                                                                                _numberError = 'Please enter a number';
                                                                              });
                                                                            } else if (newValue == null ||
                                                                                newValue < 1 ||
                                                                                newValue > 10000) {
                                                                              setState(() {
                                                                                _numberError = 'Please enter a whole numbers between 1 and 10000';
                                                                              });
                                                                            } else if (newValue <=
                                                                                number!) {
                                                                              setState(() {
                                                                                _numberError = 'Current bid is less than the previous bid';
                                                                              });
                                                                            } else {
                                                                              setState(() {
                                                                                _price.text = value;
                                                                                _numberError = null;
                                                                              });
                                                                            }
                                                                          },
                                                                          validator: (value) =>
                                                                              _numberError,
                                                                          decoration:
                                                                              const InputDecoration(labelText: 'Price'),
                                                                        ),
                                                                      ],
                                                                    )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        PrivateProvider
                                                                            state =
                                                                            Provider.of<PrivateProvider>(context,
                                                                                listen: false);
                                                                        // await state.checklogin();
                                                                        final value =
                                                                            int.parse(_price.text);
                                                                        state.updatefirstdocument(
                                                                            value,
                                                                            state.itemone![0].id!);
                                                                        _updateDefaultValue();
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        // setState(
                                                                        //     () {
                                                                        //   _price.text =
                                                                        //       '';
                                                                        //   _numberError =
                                                                        //       null;
                                                                        // });
                                                                      }
                                                                    },
                                                                    child: const Text(
                                                                        'Save'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Set price'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 75,
                                                    child: Center(
                                                      child: state.itemtwo !=
                                                              null
                                                          ? Text(
                                                              "Current Bidders: ${state.itemtwo!.length}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )
                                                          : const Text(
                                                              "Current Bidders: 5",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 200,
                                              width: 300,
                                              // margin: const EdgeInsets.only(left: 50.0),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 75,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 10.0),
                                                    child: Center(
                                                        child:
                                                            AnimatedDefaultTextStyle(
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      style: const TextStyle(
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      child: state.itemone !=
                                                              null
                                                          ? Text(
                                                              "\$ ${state.itemone![0].bidderPrice ?? ''}")
                                                          : const Text("\$20"),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ))
                            ]);
                          },
                        ))
                      ],
                    )))
          ],
        );
      }),
    );
  }
}
