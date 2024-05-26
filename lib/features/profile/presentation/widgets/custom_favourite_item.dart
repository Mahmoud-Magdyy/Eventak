import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:eventak/features/profile/data/models/favourite_model.dart';
import 'package:eventak/features/profile/presentation/widgets/favourites_details_screen.dart';
import 'package:flutter/material.dart';

class CustomFavouriteItem extends StatelessWidget {
  const CustomFavouriteItem({
    super.key,
    required this.myFavouriteModel,
  });
  final FavouriteModel myFavouriteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          // width: 329,
          // height: 160,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomImageOfEvent(
                    image: myFavouriteModel.posterPicture['secure_url'],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  TitleAndSubTitleOfEvent(
                    nameOfEvent: myFavouriteModel.nameOfEvent,
                    location: myFavouriteModel.location['street'],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomElevetedButton(
                background: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouritesEeventDetails(
                            favouriteModel: myFavouriteModel,
                                
                              )));
                },
                text: 'Show Event',
                borderColor: Colors.grey,
                color: Colors.black,
              )
            ],
          ),
        );
      }
    
  }

