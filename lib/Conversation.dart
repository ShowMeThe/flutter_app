import 'package:flutter/material.dart';
import 'package:flutter_app/conversation_page.dart';

class Conversation {
  final String avatar;
  final String title;
  final String content;
  final String time;

  const Conversation(
      {@required this.avatar,
      @required this.title,
      @required this.time,
      this.content});
}

const List<Conversation> mockConversations = [
  Conversation(
      avatar: "assets/images/1.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/2.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/3.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/1.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/2.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/3.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/1.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/2.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/3.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/1.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/2.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/3.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/1.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/2.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
  Conversation(
      avatar: "assets/images/3.jpg",
      title: "测试",
      time: "2018-11-16",
      content: "测试内容"),
];
