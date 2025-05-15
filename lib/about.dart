import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Method to launch a URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
            ),
            const SizedBox(height: 20),

            // Name Section
            const Text(
              'Hello, I am Kaheni Peter',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),

            // Short Bio Section
            const Text(
  'A Computer Science undergraduate (awaiting graduation in September), highly specialized in Software Development, Website Design & Development, Graphics Design, UI/UX Design, Artificial Intelligence & Machine Learning, Data Science, Search Engine Optimization (SEO), Database Management, Microsoft Office, and IT Support.\n\n'
  'I have a strong foundation in programming and problem-solving, with a focus on creating innovative solutions using modern technologies. I also possess a high sense of responsibility, strong teamwork skills, and the ability to work effectively under minimal supervision.',
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
),
const SizedBox(height: 20),


            // Education Section
            const Text(
              'Education:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
  'I have successfully completed my four-year degree course: Bachelor of Science in Computer Science at Karatina University. '
  'During my academic journey, I have gained extensive knowledge and hands-on experience in Software Development, Website Design & Development, '
  'Graphics Design, UI/UX Design, Artificial Intelligence & Machine Learning, Data Science, Search Engine Optimization (SEO), Database Management, '
  'Microsoft Office, and IT Support.',
  style: TextStyle(fontSize: 16),
),
const SizedBox(height: 20),


const Text(
  'Technical & Professional Skills:',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 20),
const Text(
  '✅ Programming & Development: OOP, SDLC, Agile, Git, REST APIs\n'
  '✅ Web Development: HTML, CSS, JavaScript, React.js, Node.js, WordPress\n'
  '✅ Design & UI/UX: Figma, Photoshop, Illustrator, Canva, Wireframing, Prototyping\n'
  '✅ AI & Machine Learning: Scikit-learn, TensorFlow, Keras, Pandas\n'
  '✅ Data Science & Analytics: Data Analysis, EDA, Matplotlib, Seaborn, Power BI\n'
  '✅ Database Management: MySQL, MongoDB, ER Modeling, CRUD, Normalization\n'
  '✅ SEO & Analytics: On-Page SEO, Google Analytics, Keyword Research, SEO Tools\n'
  '✅ Microsoft Office Tools: Excel, Word, PowerPoint, Google Workspace\n'
  '✅ IT Support: Troubleshooting, Networking, Software/Hardware Setup, User Support',
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
),




const Text(
  'Passion and Interests:',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 20),
const Text(
  'In addition to my studies, I am passionate about staying up to date with the latest tech trends, especially in AI, and I enjoy working on side projects in my free time. Exploring how artificial intelligence is transforming industries continues to inspire my learning and creativity.\n\n'
  'I\'m deeply interested in solving real-world problems through technology—whether it\'s building intelligent systems, optimizing user experiences, or automating repetitive tasks. I often engage in hackathons, online coding challenges, and open-source contributions to grow my skills and connect with like-minded developers.\n\n'
  'Outside of tech, I have a strong interest in creative design, personal development, and digital content creation. I believe in lifelong learning and continuously seek to expand both my technical and soft skills, aiming to become a well-rounded professional ready to make an impact.',
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
),



const Text(
  'Goals and Vision:',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 20),
const Text(
  'My vision is to leverage AI and data science to create impactful products and technologies that will help shape the future and drive innovation across industries. I aim to contribute to solutions that make life easier, businesses smarter, and systems more efficient.\n\n'
  'I am particularly motivated to work on projects that intersect with healthcare, education, and sustainability—sectors where technology can have a direct and positive influence on people’s lives. I envision building intelligent systems that support decision-making, enhance accessibility, and deliver real-time insights.\n\n'
  'In the long term, I aspire to be a thought leader in AI and innovation, continually learning and mentoring others. My goal is not only to advance in my career but also to be part of a community that uses technology as a force for good, empowering others and shaping a more connected and data-driven world.',
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
),

            // Social Media or Contact Section
            const Text(
              'Connect with me:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
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
                    _launchURL('https://wa.me/254799090598?text=Hi%2C%20I\'m%20interested%20in%20your%20portfolio%20project');
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




