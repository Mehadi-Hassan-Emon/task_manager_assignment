import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class photo_picker extends StatelessWidget {
  const photo_picker({
    super.key, required this.ontap, this.selectedPhoto,
  });

  final VoidCallback ontap;   //parameter use bcz image condition chalabe
  final XFile ? selectedPhoto;   //xfile imgage take hold korbe

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              child: Text('Photo',
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
              ),
            ),
            Expanded(
            child : Text(selectedPhoto == null?"no photo selected" :selectedPhoto!.name ,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis
                ),
                maxLines: 1,
              ),
            ),//jodi selected photo null mane khali hoi tahole no photo selected bolbe ar jodi selected photo null nah hoi tahole photo tar name show korbe
          ],

        ),
      ),
    );
  }
}
