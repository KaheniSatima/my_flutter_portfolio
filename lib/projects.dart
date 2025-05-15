import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildProjectCard({
    required BuildContext context,
    required String title,
    required String description,
    required String githubUrl,
    required String techStack,
    String? imageUrl,
    String? liveUrl, // For live demo like React app
  }) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isWide
            ? Row(
                children: [
                  if (imageUrl != null)
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: _buildProjectDetails(
                        title, description, githubUrl, techStack, liveUrl),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(imageUrl, fit: BoxFit.cover),
                    ),
                  const SizedBox(height: 12),
                  _buildProjectDetails(
                      title, description, githubUrl, techStack, liveUrl),
                ],
              ),
      ),
    );
  }

  Widget _buildProjectDetails(String title, String description,
      String githubUrl, String techStack, String? liveUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(description,
            style: const TextStyle(fontSize: 16), textAlign: TextAlign.justify),
        const SizedBox(height: 10),
        Text("Tech Stack: $techStack",
            style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.code, color: Colors.blue),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () => _launchURL(githubUrl),
              child: const Text(
                'View on GitHub',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            if (liveUrl != null) ...[
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => _launchURL(liveUrl),
                child: const Text(
                  'Live Demo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProjectCard(
              context: context,
              title: 'Churn, Sentiment & Recommendation System',
              description:
                  'An AI-driven system for analyzing customer sentiment, predicting churn, and recommending financial services.',
              githubUrl:
                  'https://github.com/KaheniSatima/kaheni-churn-prediction-system',
              techStack:
                  'Flask (Python), Scikit-learn, Pandas, Matplotlib, TextBlob/VADER, HTML, CSS, JS',
              imageUrl: 'assets/images/churn_sentiment.jpeg',
            ),
            buildProjectCard(
              context: context,
              title: 'Marketing & Sales Automation System',
              description:
                  'A smart solution to optimize sales and marketing processes through data-driven insights and automation.',
              githubUrl:
                  'https://github.com/KaheniSatima/kaheni-marketing-sales-system.git',
              techStack:
                  'Python, Flask, Scikit-learn, KMeans, ARIMA, XGBoost, Prophet',
              imageUrl: 'assets/images/marketing_automation.jpeg',
            ),
            buildProjectCard(
              context: context,
              title: 'ERP System for Business Management',
              description:
                  'An integrated platform that manages operations like HR, inventory, and finance to streamline business workflows.',
              githubUrl: 'https://github.com/KaheniSatima/kaheni_erp_system.git',
              techStack: 'Django, PostgreSQL, HTML, CSS, JS',
              imageUrl: 'assets/images/erp_system.jpeg',
            ),
            // ✅ Your React Portfolio Project
            buildProjectCard(
              context: context,
              title: 'My Developer Portfolio',
              description:
                  'A personal portfolio website built using React to showcase my skills, experience, and projects.',
              githubUrl: 'https://github.com/KaheniSatima/kaheni-portfolio',
              techStack: 'React, HTML, CSS, JavaScript, Git, GitHub',
              liveUrl: 'https://KaheniSatima.github.io/kaheni-portfolio', // Replace with your live URL
              imageUrl: 'assets/images/portfolio.jpeg',
            ),
            const SizedBox(height: 32),
            const Text(
              'Connect with me:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
