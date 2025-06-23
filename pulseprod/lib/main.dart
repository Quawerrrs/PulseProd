import 'dart:async';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseProd',
      theme: ThemeData(
        primaryColor: Color(0xFF4A90E2),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFF4D03F),
        ),
        scaffoldBackgroundColor: Color(0xFFE6F0FA),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Boostez Votre Productivité Aujourd\'hui',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A90E2),
                  shadows: [
                    Shadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 4),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Organisez, planifiez et refletez avec élégance.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.025,
                  color: Color(0xFF666666),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.35,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFA3E4D7), Color(0xFF4A90E2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mes Tâches',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight * 0.03,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      _buildTodoItem('Réunion 22/06', Icons.check_circle, false, screenHeight, screenWidth),
                                      _buildTodoItem('Tâche 23/06', Icons.circle_outlined, true, screenHeight, screenWidth),
                                      _buildTodoItem('Projet 24/06', Icons.circle_outlined, true, screenHeight, screenWidth),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Juin 2025',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.025,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _buildCalendarDay('21', screenHeight, screenWidth),
                                  _buildCalendarDay('22', screenHeight, screenWidth, isToday: true),
                                  _buildCalendarDay('23', screenHeight, screenWidth),
                                  _buildCalendarDay('24', screenHeight, screenWidth),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: screenWidth * 0.04,
                runSpacing: screenHeight * 0.01,
                children: [
                  _buildFeatureIcon(context, '🗒️', 'Todolist intelligente', () {
                    _navigateToPage(context, TodoListPage());
                  }, screenHeight, screenWidth),
                  _buildFeatureIcon(context, '📅', 'Calendrier avec notifs', () {
                    _navigateToPage(context, CalendarPage());
                  }, screenHeight, screenWidth),
                  _buildFeatureIcon(context, '⏰', 'Minuteur personnalisé', () {
                    _navigateToPage(context, TimerPage());
                  }, screenHeight, screenWidth),
                  _buildFeatureIcon(context, '✍️', 'Journal continu', () {
                    _navigateToPage(context, JournalPage());
                  }, screenHeight, screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Bonsoir ! Planifiez votre lundi 23/06 dès maintenant.',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Color(0xFF666666),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodoItem(String text, IconData icon, bool isDone, double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
      child: Row(
        children: [
          Icon(icon, size: screenHeight * 0.025, color: isDone ? Colors.white : Colors.white70),
          SizedBox(width: screenWidth * 0.015),
          Text(
            text,
            style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDay(String day, double screenHeight, double screenWidth, {bool isToday = false}) {
    return Container(
      width: screenWidth * 0.06,
      height: screenHeight * 0.04,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
      decoration: BoxDecoration(
        gradient: isToday
            ? LinearGradient(colors: [Color(0xFFF4D03F), Color(0xFF4A90E2)])
            : null,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white38),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            color: isToday ? Colors.white : Colors.white,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(BuildContext context, String icon, String label, VoidCallback onTap, double screenHeight, double screenWidth) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA3E4D7), Color(0xFF4A90E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                icon,
                style: TextStyle(fontSize: screenHeight * 0.03),
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              label,
              style: TextStyle(fontSize: screenHeight * 0.015, color: Color(0xFF333333)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('PulseProd'),
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue !',
                style: TextStyle(
                  fontSize: screenHeight * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A90E2),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Explorez nos fonctionnalités :',
                style: TextStyle(
                  fontSize: screenHeight * 0.025,
                  color: Color(0xFF666666),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: screenWidth * 0.04,
                runSpacing: screenHeight * 0.01,
                children: [
                  _buildFeatureButton(context, '🗒️', 'Todolist intelligente', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TodoListPage()));
                  }),
                  _buildFeatureButton(context, '📅', 'Calendrier avec notifs', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
                  }),
                  _buildFeatureButton(context, '⏰', 'Minuteur personnalisé', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
                  }),
                  _buildFeatureButton(context, '✍️', 'Journal continu', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => JournalPage()));
                  }),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String icon, String label, VoidCallback onTap) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA3E4D7), Color(0xFF4A90E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                icon,
                style: TextStyle(fontSize: screenHeight * 0.03),
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              label,
              style: TextStyle(fontSize: screenHeight * 0.015, color: Color(0xFF333333)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _tasks = [
    {'title': 'Réunion 22/06', 'isDone': true},
    {'title': 'Tâche 23/06', 'isDone': false},
    {'title': 'Projet 24/06', 'isDone': false},
  ];

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add({'title': _controller.text, 'isDone': false});
        _controller.clear();
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isDone'] = !_tasks[index]['isDone'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Tâches'),
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ajouter une tâche...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                ElevatedButton(
                  onPressed: _addTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA3E4D7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.015,
                    ),
                  ),
                  child: Text(
                    'Ajouter',
                    style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Dismissible(
                    key: Key(task['title']),
                    onDismissed: (direction) => _deleteTask(index),
                    child: ListTile(
                      leading: Icon(
                        task['isDone'] ? Icons.check_circle : Icons.circle_outlined,
                        color: task['isDone'] ? Color(0xFFA3E4D7) : Color(0xFF666666),
                        size: screenHeight * 0.03,
                      ),
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          decoration: task['isDone'] ? TextDecoration.lineThrough : null,
                          color: Color(0xFF333333),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Color(0xFF4A90E2)),
                        onPressed: () => _deleteTask(index),
                      ),
                      onTap: () => _toggleTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {
    DateTime(2025, 6, 23): ['Réunion matinale', 'Planification projet'],
    DateTime(2025, 6, 24): ['Délai projet'],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier'),
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Planifiez vos jours',
              style: TextStyle(
                fontSize: screenHeight * 0.04,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A90E2),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime(2025, 1, 1),
                lastDay: DateTime(2025, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay; // update `_focusedDay` here as well
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Color(0xFFF4D03F),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFFA3E4D7),
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Color(0xFF4A90E2),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Color(0xFFA3E4D7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  titleTextStyle: TextStyle(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              _selectedDay == null
                  ? 'Aucun jour sélectionné'
                  : 'Événements du ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
              style: TextStyle(
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A90E2),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedDay == null
                    ? 0
                    : (_events[_selectedDay] ?? []).length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.event, color: Color(0xFFA3E4D7)),
                    title: Text(
                      _events[_selectedDay]![index],
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Color(0xFF333333),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;
  bool _isRunning = false;
  late Timer _timer;
  final TextEditingController _customTimeController = TextEditingController();

  void _startTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _isRunning = false;
            _timer.cancel();
          }
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      _isRunning = false;
      _timer.cancel();
    }
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
      _customTimeController.clear();
    });
  }

  void _setTime(int minutes) {
    setState(() {
      _seconds = minutes * 60;
    });
  }

  void _setCustomTime() {
    final minutes = int.tryParse(_customTimeController.text) ?? 0;
    if (minutes > 0) {
      setState(() {
        _seconds = minutes * 60;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez entrer un nombre positif de minutes.')),
      );
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    _customTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minuteur'),
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Minuteur personnalisé',
              style: TextStyle(
                fontSize: screenHeight * 0.04,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A90E2),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    _formatTime(_seconds),
                    style: TextStyle(
                      fontSize: screenHeight * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _customTimeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Minutes personnalisées',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      ElevatedButton(
                        onPressed: _setCustomTime,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA3E4D7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: Text(
                          'Définir',
                          style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _setTime(5),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA3E4D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          ),
                          child: Text(
                            '5 min',
                            style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _setTime(10),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA3E4D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          ),
                          child: Text(
                            '10 min',
                            style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _setTime(15),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA3E4D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          ),
                          child: Text(
                            '15 min',
                            style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _startTimer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA3E4D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          ),
                          child: Text(
                            'Démarrer',
                            style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _stopTimer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF4D03F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          ),
                          child: Text(
                            'Arrêter',
                            style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _resetTimer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4A90E2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          ),
                          child: Text(
                            'Réinitialiser',
                            style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.white),
                          ),
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
}

class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Journal')),
      body: Center(child: Text('Journal en développement')),
    );
  }
}