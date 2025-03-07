import 'package:flutter/material.dart';
import 'package:get_jobs/Search/profile_company.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AllWorkersWidget extends StatefulWidget {

  final String userID;
  final String userName;
  final String userEmail;
  final String phoneNumber;
  final String userImageUrl;

  // ignore: use_key_in_widget_constructors
  const AllWorkersWidget({
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.userImageUrl,
});

  @override
  State<AllWorkersWidget> createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {

  void _mailto() async
  {
    var mailUrl = 'mailto: ${widget.userEmail}';
    print('widget.userEmail ${widget.userEmail}');
    
    if(await canLaunchUrlString(mailUrl))
      {
        await launchUrlString(mailUrl);
      }
    else
      {
        print('Error');
        throw ' Error Occurred';
      }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: ListTile(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen(userID: widget.userID)));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
        padding: const EdgeInsets.only(right: 12),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1),
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Image.network(
              // ignore: prefer_if_null_operators
              widget.userImageUrl == null
                  ?
                  'https://img.freepik.com/free-photo/3d-illustration-teenager-with-funny-face-glasses_1142-50955.jpg?t=st=1717136935~exp=1717140535~hmac=9c6d7d6d53d10cbb117b888d96dc907028678d011cee0942c841dddbc86706f5&w=740'
                  :
                  widget.userImageUrl
          ),
        ),
      ),
      title: Text(
        widget.userName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Visit Profile',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.grey
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.mail_outline,
        size: 30,
          color: Colors.grey,
        ),
        onPressed: (){
          _mailto();
        },
      ),
    ),
    );
  }
}
