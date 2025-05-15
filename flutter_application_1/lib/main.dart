// // // import 'package:flutter/material.dart';
// // // import 'second_screen.dart'; // Import the new file

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Navigation Lab',
// // //       initialRoute: '/',
// // //       routes: {
// // //         '/': (context) => const HomeScreen(),
// // //         '/second': (context) => const SecondScreen(),
// // //       },
// // //     );
// // //   }
// // // }

// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   _HomeScreenState createState() => _HomeScreenState();
// // // }

// // // class _HomeScreenState extends State<HomeScreen> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final TextEditingController _nameController = TextEditingController();
// // //   final TextEditingController _ageController = TextEditingController();
// // //   DateTime _selectedDate = DateTime.now();
// // //   String _selectedGender = 'Male';

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('User Registration')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Form(
// // //           key: _formKey,
// // //           child: Column(
// // //             children: [
// // //               TextFormField(
// // //                 controller: _nameController,
// // //                 decoration: const InputDecoration(labelText: 'Name'),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter your name';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               TextFormField(
// // //                 controller: _ageController,
// // //                 decoration: const InputDecoration(labelText: 'Age'),
// // //                 keyboardType: TextInputType.number,
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter your age';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 title: const Text('Date of Birth'),
// // //                 subtitle: Text('${_selectedDate.toLocal()}'.split('  ')[0]),
// // //                 trailing: const Icon(Icons.calendar_today),
// // //                 onTap: () async {
// // //                   final DateTime? picked = await showDatePicker(
// // //                     context: context,
// // //                     initialDate: _selectedDate,
// // //                     firstDate: DateTime(1900),
// // //                     lastDate: DateTime.now(),
// // //                   );
// // //                   if (picked != null && picked != _selectedDate) {
// // //                     setState(() {
// // //                       _selectedDate = picked;
// // //                     });
// // //                   }
// // //                 },
// // //               ),
// // //               DropdownButtonFormField<String>(
// // //                 value: _selectedGender,
// // //                 decoration: const InputDecoration(labelText: 'Gender'),
// // //                 items:
// // //                     ['Male', 'Female', 'Other']
// // //                         .map(
// // //                           (String value) => DropdownMenuItem<String>(
// // //                             value: value,
// // //                             child: Text(value),
// // //                           ),
// // //                         )
// // //                         .toList(),
// // //                 onChanged: (String? newValue) {
// // //                   setState(() {
// // //                     _selectedGender = newValue!;
// // //                   });
// // //                 },
// // //               ),
// // //               const SizedBox(height: 20),
// // //               ElevatedButton(
// // //                 onPressed: () {
// // //                   if (_formKey.currentState!.validate()) {
// // //                     Navigator.pushNamed(
// // //                       context,
// // //                       '/second',
// // //                       arguments: {
// // //                         'name': _nameController.text,
// // //                         'age': _ageController.text,
// // //                         'dateOfBirth': _selectedDate,
// // //                         'gender': _selectedGender,
// // //                       },
// // //                     );
// // //                   }
// // //                 },
// // //                 child: const Text('Register'),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'post_model.dart';

// // Future<List<Post>> fetchPosts() async {
// //   try {
// //     // Simulate a network delay
// //     await Future.delayed(const Duration(seconds: 2));
// //     // Fetch data from the API
// //     final response = await http.get(
// //       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
// //     );
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((post) => Post.fromJson(post)).toList();
// //     } else {
// //       throw Exception('Failed to load posts');
// //     }
// //   } catch (e) {
// //     throw Exception('Failed to load posts: $e');
// //   }
// // }

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(title: 'Flutter API Lab', home: const PostList());
// //   }
// // }

// // class PostList extends StatefulWidget {
// //   const PostList({super.key});

// //   @override
// //   _PostListState createState() => _PostListState();
// // }

// // class _PostListState extends State<PostList> {
// //   late Future<List<Post>> futurePosts;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futurePosts = fetchPosts();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('API Data')),
// //       body: FutureBuilder<List<Post>>(
// //         future: futurePosts,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Text('Failed to load data.'),
// //                   Text('Error: ${snapshot.error}'),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         futurePosts = fetchPosts(); // Retry fetching data
// //                       });
// //                     },
// //                     child: const Text('Retry'),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           } else if (snapshot.hasData) {
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(snapshot.data![index].title),
// //                   subtitle: Text(snapshot.data![index].body),
// //                 );
// //               },
// //             );
// //           } else {
// //             return const Center(child: Text('No data available'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter URL Launcher Lab',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('URL Launcher Example')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: _launchUrl,
//             child: const Text('Open URL'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void _launchUrl() async {
//   final Uri url = Uri.parse('https://flutter.dev');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController _controller = TextEditingController();
//   String _storedValue = '';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Plugin Lab',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Explore Plugins in Flutter')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _controller,
//                 decoration: const InputDecoration(labelText: 'Enter some text'),
//               ),
//               const SizedBox(
//                 height: 16,
//               ), // Adds space between TextField and Save button
//               ElevatedButton(
//                 onPressed: _saveData,
//                 child: const Text('Save Data'),
//               ),
//               const SizedBox(
//                 height: 16,
//               ), // Adds space between Save and Load button
//               ElevatedButton(
//                 onPressed: _loadData,
//                 child: const Text('Load Data'),
//               ),
//               const SizedBox(
//                 height: 16,
//               ), // Adds space between Load button and Text
//               Text('Stored Value: $_storedValue'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('myKey', _controller.text);
//   }

//   void _loadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _storedValue = prefs.getString('myKey') ?? 'No Data';
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'student_provider.dart';

late final ValueNotifier<int> notifier;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MyApp(localStorage: localStorage));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;

  const MyApp({Key? key, required this.localStorage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the MaterialApp with the ChangeNotifierProvider
    return ChangeNotifierProvider<StudentProvider>(
      create: (_) => StudentProvider(storage: localStorage),
      child: MaterialApp(
        title: 'Student Management App',
        home: HomeScreen(), // Assuming HomeScreen leads to EditStudentScreen
      ),
    );
  }
}
