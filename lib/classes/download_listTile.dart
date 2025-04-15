import 'package:flutter/material.dart';

class Download_ListTile {

  ListTile download_ListTile (String title, Icon icon) {
    return  ListTile(
                      contentPadding: EdgeInsets.all(2),
                      leading: icon,
                      title: Text(title),
                      trailing: Container( child: Icon(Icons.arrow_forward_ios, size: 13,)),
                    );
  }
}