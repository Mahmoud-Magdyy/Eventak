import 'dart:io';

import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/district.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/name_of_location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/street.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventPageThree extends StatefulWidget {
  const CreateEventPageThree({super.key});

  @override
  State<CreateEventPageThree> createState() => _CreateEventPageThreeState();
}

class _CreateEventPageThreeState extends State<CreateEventPageThree> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile> imageFileList = [];

  void selectedImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: Location()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: NameOfLocation()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: Street()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: District()),
        SliverToBoxAdapter(
          child: IconButton(
              onPressed: () {
                selectedImage();
              },
              icon: const Icon(Icons.camera)),
        ),
        SliverFillRemaining(
          // hasScrollBody: false,
          fillOverscroll: false,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: imageFileList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  // height: 100,
                  // width: 100,
                  margin: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: FileImage(
                        File(
                          imageFileList[index].path,
                        ),

                      )),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  // child: Image.file(
                  //   File(
                  //     imageFileList[index].path,
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                );
              }),
        )
      ],
    );
  }
}
