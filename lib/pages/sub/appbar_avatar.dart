import 'package:flutter/material.dart';
import 'package:private_upload/auth/privateprovider.dart';
import 'package:provider/provider.dart';

class AppbarAvatar extends StatefulWidget {
  const AppbarAvatar({super.key});

  @override
  State<AppbarAvatar> createState() => _AppbarAvatarState();
}

class _AppbarAvatarState extends State<AppbarAvatar> {
  @override
  Widget build(BuildContext context) => Consumer<PrivateProvider>(
        builder: (context, state, child) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 15.0),
            child: PopupMenuButton<int>(
              icon: const CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(
                    'https://uc1779c502115d9a0741c3693dc5.previews.dropboxusercontent.com/p/thumb/ABwChWAbWBxF1m3l0m2BPi2Tty3HVaMzk2lV0t8jFy2cOdoIURLbi29-At6s7IxOo2J_wjHRoUrPBCp3XG9lUQtBv5qmhOOPxQ9vKusHAjpbqP5b7OwLT1YS0mIiQZrOQetlX2EQMac3OFKezF_6098BmkXDtj1hePamaxilYESHbTUTW919LR5ouN7YHvSEOQYP_-UdVoTjdeExxNIrLROeAHzYdb3aHhfl9X0f1BKc5RdpcJkefA-nMswhciT9FaREF68bQ6qgV2AWKhyujb4PiVS9sPYVewD57qQchQNIJlAODgs6k8Dqm4o6JpIo3eXSMtu_YUXSr7rxqeDjN65VDqEGR7MprjnqgM-OArNVofQsfP1Hpv7MuyZBBwp6Ycs5vXvEvYnkNq3RxnvLX_-w7GuM9STDdWLamG8hIko6Ew/p.jpeg'),
              ),
              onSelected: (value) {
                // Handle the selection from the dropdown menu
              },
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 1,
                  onTap: () {
                    // do something
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Profile',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: () {
                    // do something
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Settings',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  onTap: () {
                    state.signout();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Sign Out',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
}
