import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Skills & Expertise',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'I specialize in a wide range of technologies and tools that help in solving real-world problems through innovative solutions.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            _buildSkillSection(context, 'Programming & Development', {
              'OOP': 0.9,
              'SDLC': 0.8,
              'Agile': 0.85,
              'Git': 0.9,
              'REST APIs': 0.8,
            }, FontAwesomeIcons.codeBranch),

            _buildSkillSection(context, 'Web Development', {
              'HTML': 0.9,
              'CSS': 0.8,
              'JavaScript': 0.7,
              'React.js': 0.9,
              'Node.js': 0.7,
              'WordPress': 0.6,
            }, FontAwesomeIcons.laptopCode),

            _buildSkillSection(context, 'Design & UI/UX', {
              'Figma': 0.8,
              'Photoshop': 0.9,
              'Illustrator': 0.7,
              'Canva': 0.8,
              'Wireframing': 0.7,
              'Prototyping': 0.6,
            }, FontAwesomeIcons.palette),

            _buildSkillSection(context, 'AI & Machine Learning', {
              'Scikit-learn': 0.8,
              'TensorFlow': 0.7,
              'Keras': 0.6,
              'Pandas': 0.9,
            }, FontAwesomeIcons.robot),

            _buildSkillSection(context, 'Data Science & Analytics', {
              'Data Analysis': 0.9,
              'EDA': 0.8,
              'Matplotlib': 0.7,
              'Seaborn': 0.8,
              'Power BI': 0.7,
            }, FontAwesomeIcons.chartLine),

            _buildSkillSection(context, 'Database Management', {
              'MySQL': 0.9,
              'MongoDB': 0.8,
              'ER Modeling': 0.7,
              'CRUD': 0.8,
              'Normalization': 0.8,
            }, FontAwesomeIcons.database),

            _buildSkillSection(context, 'SEO & Analytics', {
              'On-Page SEO': 0.8,
              'Google Analytics': 0.9,
              'Keyword Research': 0.8,
              'SEO Tools': 0.7,
            }, FontAwesomeIcons.magnifyingGlass),

            _buildSkillSection(context, 'Microsoft Office Tools', {
              'Excel': 0.9,
              'Word': 0.8,
              'PowerPoint': 0.7,
              'Google Workspace': 0.9,
            }, FontAwesomeIcons.fileLines),

            _buildSkillSection(context, 'IT Support', {
              'Troubleshooting': 0.9,
              'Networking': 0.8,
              'Software/Hardware Setup': 0.7,
              'User Support': 0.8,
            }, FontAwesomeIcons.screwdriverWrench),

            const SizedBox(height: 40),
            const Text(
              'Let’s Connect!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Feel free to reach out to me for collaborations or inquiries.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildSocialMediaRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillSection(
    BuildContext context,
    String category,
    Map<String, double> skillsWithProficiency,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            const SizedBox(width: 10),
            Text(
              category,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: skillsWithProficiency.entries.map((entry) {
            final skill = entry.key;
            final value = entry.value;

            Color getColor(double val) {
              if (val > 0.85) return Colors.blueAccent;
              if (val > 0.7) return Colors.green;
              if (val > 0.5) return Colors.orange;
              return Colors.red;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          skill,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Tooltip(
                        message: '${(value * 100).toInt()}%',
                        child: Text(
                          '${(value * 100).toInt()}%',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: value),
                    duration: const Duration(seconds: 1),
                    builder: (context, val, _) {
                      return LinearProgressIndicator(
                        value: val,
                        minHeight: 6,
                        backgroundColor: Colors.grey.shade300,
                        color: getColor(value),
                      );
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSocialMediaRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () {
            _launchURL('https://github.com/KaheniSatima');
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.whatsapp),
          onPressed: () {
            _launchURL(
                'https://wa.me/254799090598?text=Hi%2C%20I\'m%20interested%20in%20your%20portfolio%20project');
          },
        ),
      ],
    );
  }

  void _launchURL(String url) {
    print('Launching: $url');
  }
}
