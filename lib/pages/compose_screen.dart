import 'package:flutter/material.dart';

/// Écran "Nouveau message" façon Gmail.
///
/// Conforme à l'image de référence : flèche retour, De, À, Obet, corps du message.
/// Pas de vrai envoi de mail — données simulées.
class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  bool get _hasContent =>
      _toController.text.isNotEmpty ||
      _subjectController.text.isNotEmpty ||
      _bodyController.text.isNotEmpty;

  @override
  void dispose() {
    _toController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<bool> _confirmDiscardIfNeeded() async {
    if (!_hasContent) return true;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enregistrer comme brouillon ?'),
        content: const Text('Votre message n\'a pas été envoyé.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Supprimer'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _send() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Message envoyé'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmDiscardIfNeeded,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () async {
                if (await _confirmDiscardIfNeeded()) {
                  if (context.mounted) Navigator.of(context).pop();
                }
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.attach_file, color: Colors.black54),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pièces jointes non disponibles dans cette démo')),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Color(0xFF0B57D0)),
                onPressed: _send,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        body: Column(
          children: [
            const Divider(height: 1, color: Colors.grey),
            _ComposeRow(
              label: 'De',
              value: 'koffilevis21@gmail.com',
            ),
            const Divider(height: 1, color: Colors.grey),
            _EditableRow(
              hint: 'À',
              controller: _toController,
            ),
            const Divider(height: 1, color: Colors.grey),
            _EditableRow(
              hint: 'Objet',
              controller: _subjectController,
            ),
            const Divider(height: 1, color: Colors.grey),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  controller: _bodyController,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: 'Rédiger votre message',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.format_bold, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.format_italic, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.format_underline, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.format_color_text, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.black54),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ComposeRow extends StatelessWidget {
  const _ComposeRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(
            '$label ',
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditableRow extends StatelessWidget {
  const _EditableRow({required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
