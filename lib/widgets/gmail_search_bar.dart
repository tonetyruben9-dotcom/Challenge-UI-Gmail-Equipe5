import 'package:flutter/material.dart';

/// Barre de recherche façon Gmail, à placer en haut de la boîte de réception.
///
/// ⚠️ Conforme au cahier des charges : purement visuelle.
/// Aucune vraie recherche n'est effectuée, aucun appel réseau.
/// On simule juste l'apparence et les interactions (focus, effacer, retour).
class GmailSearchBar extends StatefulWidget {
  /// Appelé quand l'utilisateur tape sur l'avatar (pour ouvrir l'écran profil).
  final VoidCallback onAvatarTap;

  /// Initiale affichée dans l'avatar (donnée fictive).
  final String avatarInitial;

  const GmailSearchBar({
    super.key,
    required this.onAvatarTap,
    this.avatarInitial = 'F',
  });

  @override
  State<GmailSearchBar> createState() => _GmailSearchBarState();
}

class _GmailSearchBarState extends State<GmailSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clearAndUnfocus() {
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFEEF0F2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            // Icône retour quand le champ a le focus, sinon icône menu/recherche
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: _isFocused
                  ? IconButton(
                      key: const ValueKey('back'),
                      icon: const Icon(Icons.arrow_back, color: Colors.black54),
                      onPressed: () {
                        _focusNode.unfocus();
                        _clearAndUnfocus();
                      },
                    )
                  : const Padding(
                      key: ValueKey('search'),
                      padding: EdgeInsets.only(left: 14, right: 6),
                      child: Icon(Icons.search, color: Colors.black54),
                    ),
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                // Pas de logique de filtrage réelle : uniquement visuel.
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Recherche « $value » (démo, aucun résultat réel)'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                decoration: const InputDecoration(
                  hintText: 'Rechercher dans les mails',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            if (_controller.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black54),
                onPressed: _clearAndUnfocus,
              ),
            if (!_isFocused) ...[
              IconButton(
                icon: const Icon(Icons.mic, color: Colors.black54),
                tooltip: 'Recherche vocale',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Recherche vocale non disponible dans cette démo'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: widget.onAvatarTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 2),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      widget.avatarInitial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
