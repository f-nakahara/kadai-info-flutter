import 'package:flutter/material.dart';
import 'package:kadai_info_flutter/domain/entity/article_author.dart';

/// 著者
class AuthorItem extends StatelessWidget {
  const AuthorItem({
    Key? key,
    required this.author,
  }) : super(key: key);

  final ArticleAuthor author;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          children: [
            /// アバター画像
            _AvatarImage(avatarUrl: author.imageUrl),
            const SizedBox(width: 10),

            /// 著者名
            _NameText(name: author.name),
          ],
        ),
      ),
    );
  }
}

class _NameText extends StatelessWidget {
  const _NameText({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({
    Key? key,
    required this.avatarUrl,
  }) : super(key: key);

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
    );
  }
}
