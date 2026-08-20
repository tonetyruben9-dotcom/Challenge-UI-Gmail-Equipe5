import 'package:flutter/material.dart';
import '../models/mail.dart';

class MailCard extends StatelessWidget {
  const MailCard({required this.mail, super.key});

  final Mail mail;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final foregroundColor = mail.isRead ? Colors.grey.shade700 : Colors.black87;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: mail.avatarColor,
              child: Text(
                mail.initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mail.sender,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyLarge?.copyWith(
                            color: foregroundColor,
                            fontWeight: mail.isRead ? FontWeight.normal : FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mail.date,
                        style: textTheme.bodySmall?.copyWith(
                          color: mail.isRead ? Colors.grey : Colors.black87,
                          fontWeight: mail.isRead ? FontWeight.normal : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    mail.subject,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: foregroundColor,
                      fontWeight: mail.isRead ? FontWeight.normal : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    mail.preview,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.star_border, size: 22, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }
}