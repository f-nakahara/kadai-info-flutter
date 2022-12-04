import 'package:flutter/material.dart';

/// 著者
class AuthorItem extends StatelessWidget {
  const AuthorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          children: const [
            /// アバター画像
            _ThumbnailImage(),
            SizedBox(width: 10),

            /// 著者名
            _NameText(),
          ],
        ),
      ),
    );
  }
}

class _NameText extends StatelessWidget {
  const _NameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Natsuki Kojima',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const SizedBox(
        height: 25,
        width: 25,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://secure.gravatar.com/avatar/7b902e729adfcee35288b7ec039df167?s=120&d=mm&r=g',
          ),
        ),
      ),
    );
  }
}
