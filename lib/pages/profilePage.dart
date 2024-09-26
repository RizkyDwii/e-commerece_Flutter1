import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1C4997)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF1C4997)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade200,
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('images/Profile.jpeg'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rizky Dwi Maulidan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'rizky@ckmkidw.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildProfileCard(
                        icon: Icons.phone,
                        title: 'Nomor HP',
                        value: '+62 8123456789',
                      ),
                      _buildProfileCard(
                        icon: Icons.home,
                        title: 'Alamat',
                        value: 'Jl. Contoh No. 123, Kota XYZ',
                      ),
                      _buildProfileCard(
                        icon: Icons.lock_outline,
                        title: 'Edit Profile',
                        value: 'Tap to edit',
                        onTap: () {
                          // kalo ada edit profile page
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildLogoutButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF1C4997), size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (onTap != null) const Icon(Icons.chevron_right, color: Color(0xFF1C4997)),
            ],
          ),
        ),
      ),
    );
  }

   Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Apakah Anda yakin ingin logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/Loginpage');
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1C4997),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Logout',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1C4997)),
      ),
      body: const Center(
        child: Text(
          'Halaman Setting',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
