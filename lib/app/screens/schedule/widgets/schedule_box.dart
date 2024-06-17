import 'package:flutter/material.dart';

import '../../../shared/themes/theme.dart';

class ScheduleBox extends StatefulWidget {
  final String startTime;
  final String endTime;
  final String sala;
  final String subject;
  final Function()? onEdit;

  const ScheduleBox({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.sala,
    required this.subject,
    this.onEdit,
  }) : super(key: key);

  @override
  _ScheduleBoxState createState() => _ScheduleBoxState();
}

class _ScheduleBoxState extends State<ScheduleBox> {
  bool editing = false; // Flaga określająca, czy edytujemy dane zajęcia

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Adjusted here
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.startTime,
                        style: TextStyle(
                          color: checkBox,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.endTime,
                        style: TextStyle(
                          color: checkBox,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Moved 'Sala' and 'Przedmiot' column here
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subject,
                        style: TextStyle(
                          color: checkBox,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.sala,
                        style: TextStyle(
                          color: checkBox,
                          fontSize: 16.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      editing =
                          !editing; // Przełącz tryb edycji po kliknięciu w ikonę trzech kropek
                    });
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: checkBox,
                  ),
                ),
              ],
            ),
          ),
          if (editing) _buildEditView(), // Renderuj tylko w trybie edycji
        ],
      ),
    );
  }

  Widget _buildEditView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            initialValue: widget.startTime,
            decoration: InputDecoration(
              labelText: 'Godzina rozpoczęcia',
              labelStyle: TextStyle(
                color: Colors
                    .red[900], // Ustawia kolor tekstu etykiety na niebieski
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: backgroundColor, // Kolor podkreślenia, gdy pole jest aktywne
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            initialValue: widget.endTime,
            decoration: InputDecoration(
              labelText: 'Godzina zakończenia',
              labelStyle: TextStyle(
                color: Colors
                    .red[900], // Ustawia kolor tekstu etykiety na niebieski
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: backgroundColor, // Kolor podkreślenia, gdy pole jest aktywne
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            initialValue: widget.subject,
            decoration: InputDecoration(
              labelText: 'Przedmiot',
              labelStyle: TextStyle(
                color: Colors
                    .red[900], // Ustawia kolor tekstu etykiety na niebieski
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: backgroundColor, // Kolor podkreślenia, gdy pole jest aktywne
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            initialValue: widget.sala,
            decoration: InputDecoration(
              labelText: 'Sala',
              labelStyle: TextStyle(
                color: Colors
                    .red[900], // Ustawia kolor tekstu etykiety na niebieski
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: backgroundColor, // Kolor podkreślenia, gdy pole jest aktywne
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF8B0000), // Kolor tekstu (biały)
              ),
              onPressed: () {
                // Logika zapisu edytowanych danych
                setState(() {
                  editing = false; // Wyjście z trybu edycji po zapisaniu
                });
              },
              child: const Text(
                'Zapisz zmiany',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
