import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:f10/_shared_text_widget.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  TextSelection _currentSelection = TextSelection.collapsed(offset: 0);

  void _onSelectionChange(TextSelection textSelection) {
    setState(() {
      _currentSelection = textSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedText = _currentSelection.textInside(sharedText);
    return Center(
      child: SizedBox(
        width: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextEditor(
              text: sharedText,
              style: sharedTextStyle,
              onSelectionChange: _onSelectionChange,
            ),
            SizedBox(height: 48),
            Text(
              selectedText.isNotEmpty ? selectedText : 'No Text Selected',
              style: sharedTextStyle.copyWith(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextEditor extends StatefulWidget {
  const TextEditor({
    Key? key,
    this.text = '',
    required this.style,
    required this.onSelectionChange,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final void Function(TextSelection) onSelectionChange;

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: widget.style,
    );
  }
}

class _SelectionPainter extends CustomPainter {
  _SelectionPainter({
    required Color color,
    required List<Rect> rects,
    bool fill = true,
  })  : _color = color,
        _rects = rects,
        _fill = fill,
        _paint = Paint()..color = color;

  final Color _color;
  final bool _fill;
  final List<Rect> _rects;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.style = _fill ? PaintingStyle.fill : PaintingStyle.stroke;
    for (final rect in _rects) {
      canvas.drawRect(rect, _paint);
    }
  }

  @override
  bool shouldRepaint(_SelectionPainter other) {
    return true;
  }
}
