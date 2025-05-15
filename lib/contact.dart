import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get in Touch',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Feel free to reach out for collaborations, freelance opportunities, or any inquiries.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    ContactInfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'pk2532625@gmail.com',
                    ),
                    ContactInfoTile(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '+254799090598',
                    ),
                    ContactInfoTile(
                      icon: Icons.location_on,
                      label: 'Location',
                      value: 'Nairobi, Kenya',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Social Media',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SocialIcon(
                      icon: FontAwesomeIcons.github,
                      url: 'https://github.com/KaheniSatima',
                    ),
                    const SizedBox(width: 16),
                    SocialIcon(
                      icon: FontAwesomeIcons.whatsapp,
                      url: 'https://wa.me/254799090598',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialIcon({Key? key, required this.icon, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, size: 30),
      onPressed: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open $url')),
          );
        }
      },
    );
  }
}
