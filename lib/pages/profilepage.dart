import 'package:flutter/material.dart';
import '../managers/profilemanager.dart';
import "../datas/profile.dart";
import '../auth.dart';
// Create a stateless widget called ProfilePage
class ProfilePage extends StatelessWidget {
// Initialize default values for various profile information
  int booksshared;
  int bookstaken;
  int booksdonated;
  int tokens;
  Profile prof =
      Profilemanager.profile ?? Profile("null", "null", "0", "0", "location");
  String profileImageUrl;
  int savedpapers = 10;
  double savedcarbonemission = 0.5;
  double savedwater = 2.4;

// Create a constructor for the ProfilePage class to accept values for profile information
  ProfilePage({
    super.key,
    this.booksshared = 0,
    this.bookstaken = 50,
    this.booksdonated = 233,
    this.tokens = 20,
    this.profileImageUrl =
        'https://www.dlf.pt/dfpng/middlepng/247-2479526_round-profile-picture-png-transparent-png.png',
  }) {
  // If the profile exists, update the values with the profile information
    booksdonated = prof.booksdonated;
    booksshared = prof.booksshared;
    bookstaken = prof.bookstaken;
    tokens = prof.token;
  }
// Build the UI for the ProfilePage
  @override
  Widget build(BuildContext context) {
    final int totalbook = booksdonated + booksshared;
    return Scaffold(
      //onPressed: () => Auth().signOut(),
     // Create a column to organize the UI elements
      body: Column(
        children: [
        // Create a container for the logout button and add it to the top right of the screen
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.output, color: Colors.black),
                    onPressed: () => Auth().signOut()),

                SizedBox(width: 16.0), // Add a SizedBox with a width of 16.0
              ],
            ),
          ),
          // Create a container for the user's profile picture and token count
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // changed to center
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 16.0), // added SizedBox to add some space
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    'Tokens: $tokens',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books shared',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$booksshared'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books taken',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$bookstaken'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books donated',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$booksdonated'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '\n   You Saved!',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                        "\n     ${savedpapers * totalbook} "
                        'kg of paper are saved',
                        style: const TextStyle(fontSize: 18)),
                    Text(
                        "\n     ${savedcarbonemission * totalbook} "
                        'kg of CO2 emission are prevented',
                        style: const TextStyle(fontSize: 18)),
                    Text(
                        "\n     ${savedcarbonemission * totalbook} "
                        'L of industrial water are prevented',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
