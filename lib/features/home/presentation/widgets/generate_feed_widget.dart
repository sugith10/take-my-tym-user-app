import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/data/datasources/remote/buy_tym_community_posts.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

class GenerateFeedWidget extends StatelessWidget {
  final String? image;
  final String service;
  final String title;
  const GenerateFeedWidget({
    this.image,
    required this.service,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      
      stream: BuyTymCommunityPostsRepo().newPosts(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
       List<DocumentSnapshot> documents =  snapshot.data!.docs;
         
            return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: List.generate(documents.length, (index) {
                Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
                
                       PostModel postModel = PostModel(
                  tymType: data['tymType'],
                  uid: data['uid'],
                  workType: data['workType'],
                  title: data['title'],
                  content: data['content'],
                  userName: data['userName'],
                  location: data['location'],
                  skillLevel: data['skillLevel'],
                  price: data['price'],
                  postDate: (data['postDate'] as Timestamp),
                  skills: List<String>.from(data['skills']),
                  latitude: data['latitude'],
                  longitude: data['longitude'],
                );
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: PostedContentWidget(
                    voidCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostPage(postModel: postModel),
                        ),
                      );
                    },
                    image: image,
                    postModel: postModel,
                    width: 300,
                  ),
                );
              }),
            ),
          ),
        );
        }
       return const Center(child: CircularProgressIndicator());
      
      }
    );
  }
}
