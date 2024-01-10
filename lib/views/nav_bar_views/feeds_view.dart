import 'package:flutter/material.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Card(
            margin: EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Image(
                height: 200,
                width: double.infinity,
                image: NetworkImage(
                    'https://images.freeimages.com/images/large-previews/d1a/woman-1434754.jpg'),
                fit: BoxFit.cover,
              ),
              Text(
                'Communicate with friends',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )
            ]),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return buildPost();
              
            },
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  Widget buildPost() => Card(
        margin: const EdgeInsets.all(8.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://images.freeimages.com/images/large-previews/3b2/woman-1571719.jpg'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Abdullah Mansour',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 5, 4, 4)),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        'June 21, 2021 at 11:00 PM',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 112, 108, 108)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 24.0,
                      color: Color.fromARGB(255, 60, 58, 58),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 149, 149, 149),
                ),
              ),
              const Text(
                'Leorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 5, 4, 4),
                  height: 1.3, // Add line spacing here
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 7.0),
                        child: Container(
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            height: 25,
                            minWidth: 1,
                            child: const Text(
                              '#software',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 7.0),
                        child: Container(
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            height: 25,
                            minWidth: 1,
                            child: const Text(
                              '#software',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 7.0),
                        child: Container(
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            height: 25,
                            minWidth: 1,
                            child: const Text(
                              '#software',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 7.0),
                        child: Container(
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            height: 25,
                            minWidth: 1,
                            child: const Text(
                              '#software',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://images.freeimages.com/images/large-previews/3b2/woman-1571719.jpg',
                      ),
                    )),
                width: double.infinity,
                height: 140,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border,
                              size: 24.0, color: Colors.pink),
                        ),
                      ),
                      const Text('1200'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.insert_comment_outlined,
                              size: 24.0,
                              color: Color.fromARGB(255, 218, 198, 20)),
                        ),
                      ),
                      const Text('1200'),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 149, 149, 149),
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://images.freeimages.com/images/large-previews/3b2/woman-1571719.jpg'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Write a comment...',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 112, 108, 108)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 7.0),
                            child: Icon(Icons.favorite_border,
                                size: 18.0, color: Colors.pink),
                          ),
                          Text('like', style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
