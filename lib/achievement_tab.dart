import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AchievementTab extends StatelessWidget {
  final Color primaryYellow = Color(0xFFFFE893);
  final Color primaryPink = Color(0xFFFF6B6B);
  final Color primaryGreen = Color(0xFF4ECDC4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAchievementSummary(),
            SizedBox(height: 24),
            
            _buildSectionTitle('Latest Achievements'),
            SizedBox(height: 12),
            _buildLatestAchievements(),
            
            SizedBox(height: 24),
            _buildSectionTitle('Achievement Categories'),
            SizedBox(height: 12),
            _buildCategoriesGrid(),

            SizedBox(height: 24),
            _buildSectionTitle('Milestones'),
            SizedBox(height: 12),
            _buildMilestonesCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementSummary() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryPink, primaryPink.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryPink.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Achievements',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Keep pushing your limits!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '14 Day Streak',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  label: 'Total',
                  value: '24',
                  subtext: 'Achievements',
                ),
              ),
              Container(height: 40, width: 1, color: Colors.white24),
              Expanded(
                child: _buildSummaryItem(
                  label: 'This Month',
                  value: '8',
                  subtext: 'New Badges',
                ),
              ),
              Container(height: 40, width: 1, color: Colors.white24),
              Expanded(
                child: _buildSummaryItem(
                  label: 'Level',
                  value: '12',
                  subtext: '3.2k exp',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSummaryItem({
    required String label,
    required String value,
    required String subtext,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2),
        Text(
          subtext,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLatestAchievements() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAchievementItem(
            icon: Icons.whatshot,
            title: 'On Fire!',
            description: '14 day tracking streak',
            reward: '+200 coins',
            color: Color(0xFFFFB946),
            isNew: true,
          ),
          SizedBox(height: 16),
          _buildAchievementItem(
            icon: Icons.fitness_center,
            title: 'Workout Master',
            description: 'Completed 20 workouts',
            reward: '+300 coins',
            color: primaryGreen,
            isNew: true,
          ),
          SizedBox(height: 16),
          _buildAchievementItem(
            icon: Icons.trending_down,
            title: 'Weight Loss Goal',
            description: 'Lost first 2kg',
            reward: '+500 coins',
            color: primaryPink,
            isNew: false,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildCategoryCard(
          'Exercise',
          '8/12',
          Icons.fitness_center,
          primaryGreen,
        ),
        _buildCategoryCard(
          'Nutrition',
          '6/10',
          Icons.restaurant_menu,
          primaryPink,
        ),
        _buildCategoryCard(
          'Weight Goals',
          '4/8',
          Icons.track_changes,
          Color(0xFFFFB946),
        ),
        _buildCategoryCard(
          'Consistency',
          '5/8',
          Icons.calendar_today,
          primaryPink,
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    String title,
    String progress,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: color.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 4,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                progress,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMilestoneItem(
            'First Week Complete',
            'Logged all meals for 7 days',
            '500 coins',
            true,
            primaryGreen,
          ),
          SizedBox(height: 16),
          _buildMilestoneItem(
            'Exercise Enthusiast',
            'Complete 10 workouts',
            '1,000 coins',
            false,
            primaryPink,
          ),
          SizedBox(height: 16),
          _buildMilestoneItem(
            'Weight Goal Champion',
            'Reach your target weight',
            '2,000 coins',
            false,
            Color(0xFFFFB946),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem({
    required IconData icon,
    required String title,
    required String description,
    required String reward,
    required Color color,
    required bool isNew,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  if (isNew) ...[
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: primaryPink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'NEW',
                        style: TextStyle(
                          color: primaryPink,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                reward,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFFB946),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMilestoneItem(
    String title,
    String description,
    String reward,
    bool isCompleted,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted ? color : Colors.black12,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCompleted ? Icons.check : Icons.lock,
            color: Colors.white,
            size: 14,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color(0xFFFFB946).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            reward,
            style: TextStyle(
              color: Color(0xFFFFB946),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}