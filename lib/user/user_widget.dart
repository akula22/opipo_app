import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "images/logo.png",
                        height: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Username',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 3),
                              Text('Data',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 5),
                              Text(
                                'FIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIOFIO',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    onTap: () {
                      print(1);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
