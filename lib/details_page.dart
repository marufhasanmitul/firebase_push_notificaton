import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('${widget.data['match_name']}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${widget.data['match_name']}',style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  Text("${widget.data['team_a']}:${widget.data['team_b']}",style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  Text("Time : ${widget.data['time']}",style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 10,),
                  Text("Total Time :${widget.data['total_time']}",style: Theme.of(context).textTheme.titleMedium,),

                ],
              ),
            ),
          ),
        ),
    );
  }
}
