import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat.provider.dart';
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
        title: const Text('Adivinador ^_-', textAlign: TextAlign.center),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  
  }

}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {

                  final message = chatProvider.messageList[index];

                  return ( message.fromWho == FromWho.hers )
                    ? HerMessageBubble( message: message)
                    : MyMessageBubble( message: message );
                
                }
              )
            ),


            const SizedBox( height: 5 ),

            MessageFieldBox(
              /* onValue: (value) => chatProvider.sendMessage( value ), */
              onValue: chatProvider.sendMessage
            ),

            const SizedBox( height: 5 ),

          ],
        ),
      ),
    );

  }

}
