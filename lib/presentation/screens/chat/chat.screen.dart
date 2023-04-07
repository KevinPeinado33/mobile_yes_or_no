import 'package:flutter/material.dart';

import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.widget.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.widget.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.widget.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://e.rpp-noticias.io/normal/2022/12/09/434643_1358961.jpg'),
          )
        ),
        title: const Text('Pampam O_O'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  
  }

}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {

                  return ( index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
                
                }
              )
            ),

            const MessageFieldBox()

          ],
        ),
      ),
    );

  }

}
