import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data section: In real app, fetch from backend/provider
    final Map<String, dynamic> supervisor = {
      'name': "Rajesh Thakur",
      'email': "thakurji@gmail.com",
      'phone': "+91 98765 43210",
      'avatarUrl': 'assets/profile.png'
    };
    final Map<String, dynamic> farm = {
      'name': "Sunny Acres Organic",
      'location': "Plot 57 , Bhosari",
      'size': "320 acres",
      'crops': ["Wheat", "Rice", "Sugarcane", "Groundnut"],
      'employees': 12,
      'annualYield': "750 tons"
    };

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF70e1f5), Color(0xFFFFD860)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile card with avatar
                Card(
                  elevation: 8,
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: AssetImage('assets/profile.png'),

                        ),
                        const SizedBox(height: 16),
                        Text(supervisor['name'] as String,
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_outlined, color: Colors.blueGrey.shade600, size: 18),
                            const SizedBox(width: 6),
                            Text(supervisor['email'] as String, style: const TextStyle(color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: Colors.blueGrey.shade600, size: 18),
                            const SizedBox(width: 6),
                            Text(supervisor['phone'] as String, style: const TextStyle(color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.edit, size: 20),
                          label: const Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(), backgroundColor: Colors.black54),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Farm section
                Card(
                  elevation: 6,
                  color: Colors.white.withOpacity(0.88),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    child: Column(
                      children: [
                        Text("Farm Details",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold, color: Colors.green.shade700, letterSpacing: 0.5)),
                        const Divider(height: 16),

                        ListTile(
                          leading: const Icon(Icons.location_on_rounded, color: Colors.orange),
                          title: Text(farm['location'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: const Text("Location"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.map_rounded, color: Colors.blue),
                          title: Text(farm['size'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: const Text("Farm Size"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.grain, color: Colors.brown),
                          title: Text((farm['crops'] as List<String>).join(", "),
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: const Text("Crops"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.groups_2, color: Colors.indigo),
                          title: Text("${farm['employees']} Farmers",
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        ListTile(
                          leading: const Icon(Icons.bar_chart, color: Colors.deepPurple),
                          title: Text(farm['annualYield'] as String,
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: const Text("Annual Yield"),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 6),
                // Logout Button
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.redAccent.shade700,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
