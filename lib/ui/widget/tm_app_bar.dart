import 'package:flutter/material.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
class TMAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: InkWell(//kono kicuhu clickablr korte use hoi
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>UpdateProfileScreen()));

        },
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Taufiqur Sabbir',//eibabe text image er side e deya jai
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text('a@b.com',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: (){

          ///Authcontroller
          AuthController.clearUserData();
          Navigator.pushNamedAndRemoveUntil(context, '/Login', (predicate)=>false);
        }, icon: Icon(Icons.logout))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);//eita TMapp bar e click korle error jate nah ashe tai and er size ktool height dise jate sob jaigai sothik height nei
}
