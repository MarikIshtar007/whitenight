import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Member {
  final String name;
  bool canCallGreen;
  bool canCallYellow;
  bool canCallRed;

  Member(this.name, {this.canCallGreen = false, this.canCallYellow = false, this.canCallRed = false});
}

class MyApp extends StatelessWidget {
  final List<Member> members = [
    Member('John Doe'),
    Member('Alice Smith'),
    Member('Bob Johnson'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Village Members'),
        ),
        body: MemberList(members: members),
      ),
    );
  }
}

class MemberList extends StatefulWidget {
  final List<Member> members;

  MemberList({required this.members});

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.members.length,
      itemBuilder: (context, index) {
        final member = widget.members[index];
        return ListTile(
          title: Text(member.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.check, color: member.canCallGreen ? Colors.green : Colors.grey),
                onPressed: () {
                  // Handle Green button action
                  setState(() {
                    member.canCallGreen = !member.canCallGreen;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.check, color: member.canCallYellow ? Colors.yellow : Colors.grey),
                onPressed: () {
                  // Handle Yellow button action
                  setState(() {
                    member.canCallYellow = !member.canCallYellow;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.check, color: member.canCallRed ? Colors.red : Colors.grey),
                onPressed: () {
                  // Handle Red button action
                  setState(() {
                    member.canCallRed = !member.canCallRed;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
