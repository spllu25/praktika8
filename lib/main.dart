import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главная',
      home: ListScreens(),
      routes: {
        '/contacts': (context) => ListViewScreen(),
      },
    );
  }
}


class ListScreens extends StatefulWidget {
  @override
  _ListScreensState createState() => _ListScreensState();
}

class _ListScreensState extends State<ListScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Контактная информация'),
      ),
      body: Center(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 50.0,
                    height: 50.0,
                  ),
                  Container(
                    color: Colors.purpleAccent,
                    child: CachedNetworkImage(
                      imageUrl: 'https://polotnos.cdnbro.com/posts/690238-klipart-zametki-40.jpg',
                        width: 150,
                        height: 150,
                      progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                      errorWidget: (context,url,error) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red
                        )
                      )
                    )
                  ),
                  const SizedBox(
                    width: 100.0,
                    height: 200.0,
                  ),
                  Container(
                      color: Colors.purpleAccent,
                      child:CachedNetworkImage(
                          imageUrl: 'https://782329.selcdn.ru/leonardo/uploadsForSiteId/201231/texteditor/b8109cdf-f7fe-47d8-933a-b4828bd3eed0.png',
                          width: 200,
                          height: 200,
                          progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                          errorWidget: (context,url,error) => const Center(
                              child: Icon(
                                  Icons.error,
                                  color: Colors.red
                              )
                          )
                      )
                  ),
                  const SizedBox(
                    width: 100.0,
                    height: 200.0,
                  ),
                  Container(
                      color: Colors.purpleAccent,
                      child:CachedNetworkImage(
                          imageUrl: 'https://kartinki.pibig.info/uploads/posts/2023-03/1680239566_kartinki-pibig-info-p-napominalka-smeshnaya-kartinka-arti-6.jpg',
                          width: 200,
                          height: 200,
                          progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                          errorWidget: (context,url,error) => const Center(
                              child: Icon(
                                  Icons.error,
                                  color: Colors.red
                              )
                          )
                      )
                  ),
            ],
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text('Заметки'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ColumnListScreen()));
                  },
                ),
                const SizedBox(width: 100.0, height: 50.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text('Контакты'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/contacts');
                  },
                ),
                const SizedBox(width: 100.0, height: 50.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text('Напоминания'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewSeparatedScreen()));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    color: Colors.purpleAccent,
                    child:CachedNetworkImage(
                        imageUrl: 'https://vectorified.com/images/lilac-icon-24.png',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    color: Colors.purpleAccent,
                    child:CachedNetworkImage(
                        imageUrl: 'https://cont.ws/uploads/posts2/773982.jpg',
                        width: 250,
                        height: 250,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    color: Colors.purpleAccent,
                    child:CachedNetworkImage(
                        imageUrl: 'https://sc01.alicdn.com/kf/HTB1s.R9kFooBKNjSZFPq6xa2XXa8/227186619/HTB1s.R9kFooBKNjSZFPq6xa2XXa8.jpg',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
              ],
            ),
          ],
        ),
    ),
    );
  }
}




class ColumnListScreen extends StatefulWidget {
  @override
  _ColumnListScreenState createState() => _ColumnListScreenState();
}

class _ColumnListScreenState extends State<ColumnListScreen> {
  final TextEditingController textController = TextEditingController();
  List<String> items1 = [];

  @override
  void initState() {
    super.initState();
    getSavedText().then((savedItems) {
      if (savedItems.isNotEmpty) {
        setState(() {
          items1 = savedItems;
        });
      }
    });
  }

  void addItem(String item) {
    setState(() {
      items1.add(item);
      saveText(items1);
    });
  }

  void removeItem(int index) {
    setState(() {
      items1.removeAt(index);
      saveText(items1);
    });
  }

  Future<void> saveText(List<String> items1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items1', items1);
  }

  Future<List<String>> getSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('items1') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text('Заметки'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(width: 100.0, height: 50.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            ),
            onPressed: () async {
              String newItem = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  String inputText = '';
                  return AlertDialog(
                    backgroundColor: Colors.blueAccent,
                    title: Text('Новая заметка'),
                    content: TextField(
                      controller: textController,
                      onChanged: (value) {
                        inputText = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop(inputText);
                          textController.clear();
                        },
                      ),
                    ],
                  );
                },
              );

              if (newItem != null && newItem.isNotEmpty) {
                addItem(newItem);
              }
            },
            child: Text('Добавить заметку'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items1[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeItem(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  List<String> items2 = [];

  @override
  void initState() {
    super.initState();
    getSavedText().then((savedItems) {
      if (savedItems.isNotEmpty) {
        setState(() {
          items2 = savedItems;
        });
      }
    });
  }

  void addItem(String item) {
    setState(() {
      items2.add(item);
      saveText(items2);
    });
  }

  void removeItem(int index) {
    setState(() {
      items2.removeAt(index);
      saveText(items2);
    });
  }

  Future<void> saveText(List<String> items2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items2', items2);
  }

  Future<List<String>> getSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('items2') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Контакты'),
      ),
      body: ListView.builder(
        itemCount: items2.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items2[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          String newItem1 = '';
          String newItem2 = '';
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blueAccent,
                title: const Text('Новый контакт'),
                content: Column(
                  children: <Widget>[
                    const Text('Имя'),
                    TextField(
                      controller: nameController,
                      onChanged: (value) {
                        newItem1 = value;
                      },
                    ),
                    const Text('Номер'),
                    TextField(
                      controller: numberController,
                      onChanged: (value) {
                        newItem2 = value;
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop('$newItem1 - $newItem2');
                      nameController.clear();
                      numberController.clear();
                    },
                  ),
                ],
              );
            },
          );
          if (newItem1.isNotEmpty && newItem2.isNotEmpty) {
            addItem('$newItem1 - $newItem2');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}





class ListViewSeparatedScreen extends StatefulWidget {
  @override
  _ListViewSeparatedScreenState createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  final TextEditingController textController = TextEditingController();
  List<String> items = [];

  void addItem() {
    setState(() {
      items.add('Напоминание ${items.length + 1}');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent ,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Напоминания'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}