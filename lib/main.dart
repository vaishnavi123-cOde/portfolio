import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  _PortfolioHomeState createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildHeroSection(),
              _buildAboutSection(),
              _buildEducationSection(),
              _buildSkillsSection(),
              _buildProjectsSection(),
              _buildExperienceSection(),
              _buildCertificationsSection(),
              _buildContactSection(),
              _buildFooter(),
            ]),
          ),
        ],
      ),
    );
  }

  // AppBar and Nav
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 80,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white.withOpacity(0.95),
      elevation: 0,
      title: const Text(
        'Portfolio',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        _buildNavButton('About', 600),
        _buildNavButton('Education', 900),
        _buildNavButton('Skills', 1300),
        _buildNavButton('Projects', 1900),
        _buildNavButton('Experience', 3200),
        _buildNavButton('Contact', 3800),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavButton(String text, double offset) {
    return TextButton(
      onPressed: () => _scrollToSection(offset),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Hero
  Widget _buildHeroSection() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.purple.shade400,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: const AssetImage('assets/23XVM10513.jpeg'),
                  backgroundColor: Colors.grey.shade300,

                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ganti Vaishnavi',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'AI/ML Engineer & Computer Science Student',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _scrollToSection(3800),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade600,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // About
  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Motivated and meticulous Computer Science student with strong analytical, communication, and teamwork skills. Proven ability to adapt quickly to new environments and committed to continuous learning and professional development.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Known for a positive attitude and a strong desire to contribute to team success. Currently pursuing Bachelor of Technology in Computer Science with a focus on AI/ML and data science applications.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  // Education
  Widget _buildEducationSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          _buildEducationItem(
            'Bachelor of Technology in Computer Science',
            'CR RAO AIMSCS, Hyderabad',
            '2023 - 2027',
            'GPA: 9.65',
            Colors.blue,
          ),
          const SizedBox(height: 24),
          _buildEducationItem(
            'Intermediate: MPC',
            'Maasters Academy',
            '2021 - 2023',
            'Percentage: 98.7%',
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String degree, String institution, String period,
      String grade, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.school, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    degree,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    institution,
                    style: TextStyle(
                      fontSize: 14,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        period,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        grade,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Skills
  Widget _buildSkillsSection() {
    final skills = [
      {'name': 'Python', 'level': 0.9, 'color': Colors.blue},
      {'name': 'Machine Learning', 'level': 0.85, 'color': Colors.green},
      {'name': 'Object Detection (YOLO)', 'level': 0.8, 'color': Colors.orange},
      {'name': 'Data Visualization', 'level': 0.75, 'color': Colors.purple},
      {'name': 'Java', 'level': 0.8, 'color': Colors.red},
      {'name': 'DevOps', 'level': 0.7, 'color': Colors.teal},
      {'name': 'HTML/CSS', 'level': 0.75, 'color': Colors.pink},
      {'name': 'C Programming', 'level': 0.8, 'color': Colors.indigo},
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          ...skills.map((skill) => _buildSkillItem(
            skill['name'] as String,
            skill['level'] as double,
            skill['color'] as Color,
          )),
        ],
      ),
    );
  }

  Widget _buildSkillItem(String name, double level, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                '${(level * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  // Projects
  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          _buildProjectCard(
            'Weapon Detection System',
            'Developed a real-time weapon detection system for public safety using YOLO v8 model with custom dataset annotations.',
            ['Python', 'YOLO v8', 'Computer Vision', 'Object Detection'],
            Colors.red,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            'Video Content Moderation',
            'Engineered a hybrid CNN-LSTM model for video content moderation using real-time Kaggle datasets at Digital Dots.',
            ['Python', 'CNN-LSTM', 'Deep Learning', 'Kaggle'],
            Colors.purple,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            'Apple Music Data Visualization',
            'Performed comprehensive data preprocessing and visualization using t-SNE on Apple Music dataset from Kaggle.',
            ['Python', 't-SNE', 'Data Visualization', 'Pandas'],
            Colors.blue,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            'Text to 3D Object Converter',
            'Built an innovative model that converts text descriptions into 3D objects using machine learning techniques.',
            ['Python', 'Machine Learning', '3D Modeling', 'NLP'],
            Colors.orange,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            'Weather Application',
            'Developed a full-stack weather application displaying current weather and 5-day forecast using NodeJS and ReactJS.',
            ['NodeJS', 'ReactJS', 'REST API', 'JavaScript'],
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description,
      List<String> technologies, Color accentColor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies
                  .map((tech) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    fontSize: 12,
                    color: accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Experience
  Widget _buildExperienceSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Experience',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          _buildExperienceItem(
            'AI/ML Intern',
            'IIIT Hyderabad',
            'May 2025 - Jun 2025',
            'Collaborated on object detection projects using YOLO for real-time datasets. Created custom dataset with manual annotations and worked on weapon detection for public safety using YOLO v8 model.',
          ),
          const SizedBox(height: 24),
          _buildExperienceItem(
            'AI/ML Intern',
            'Digital Dots',
            'Mar 2025 - May 2025',
            'Engineered a hybrid CNN-LSTM model for video content moderation using real-time Kaggle datasets. Focused on developing robust machine learning solutions for content filtering.',
          ),
          const SizedBox(height: 24),
          _buildExperienceItem(
            'DevOps Contributor',
            'Project Sunshine (HCL)',
            '2024',
            'Contributed to Project Sunshine as part of a comprehensive DevOps and AI course. Gained hands-on experience with modern deployment practices and AI integration.',
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      String position, String company, String period, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                position,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$company • $period',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Certifications
  Widget _buildCertificationsSection() {
    final certifications = [
      'AI Essentials by Google, Coursera',
      'AIML course by iHub-Data, IIIT Hyderabad',
      'Communication skills by TCS',
      'DevOps using AI by HCL',
      'Cybersecurity by Google, Coursera',
      'Quantum Computing by IIT Roorkee and C-DAC',
      'MS Tools using AI by beat10x',
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Certifications',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: certifications.length,
            itemBuilder: (context, index) {
              final colors = [
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.purple,
                Colors.red,
                Colors.teal,
                Colors.pink
              ];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors[index % colors.length].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: colors[index % colors.length].withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: colors[index % colors.length],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        certifications[index],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Contact
  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Have a project in mind? Let\'s work together to create something amazing!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildContactItem(
                  Icons.email,
                  'Email',
                  'nagavaishnaviganti@gmail.com',
                  Colors.red,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildContactItem(
                  Icons.phone,
                  'Phone',
                  '+91 9959376517',
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildContactItem(
                  Icons.code,
                  'GitHub',
                  'github.com/vaishnavi123-c0de',
                  Colors.black87,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildContactItem(
                  Icons.location_on,
                  'Location',
                  'Hyderabad, 500032',
                  Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      IconData icon, String label, String value, Color color) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // TODO: add open-email / phone / url logic
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Footer
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade900,
      child: Center(
        child: Text(
          '© 2024 Ganti Vaishnavi. Built with Flutter 💙',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
