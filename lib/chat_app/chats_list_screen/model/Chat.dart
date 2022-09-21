class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat(
      {this.name = "",
      this.lastMessage = "",
      this.image = "",
      this.time = "",
      this.isActive = false});
}

List chatsData = [
  Chat(
    name: "Eslam Medhat",
    lastMessage: "Hope you are doing well...",
    image: "assets/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Omar Defaoui",
    lastMessage: "Hello Eslam, how r u ?",
    image: "assets/user_2.png",
    time: "1m ago",
    isActive: true,
  ),
  Chat(
    name: "Mohamed Jameel",
    lastMessage: "Where is the task ?",
    image: "assets/user.png",
    time: "20s ago",
    isActive: true,
  ),
  Chat(
    name: "Rahhal El boudali",
    lastMessage: "See you soon guys ?",
    image: "assets/user_4.png",
    time: "20m ago",
    isActive: false,
  ),
  Chat(
    name: "Ga Naw",
    lastMessage: "Good Bye everyone?",
    image: "assets/user_3.png",
    time: "18m ago",
    isActive: true,
  ),
  Chat(
    name: "Nuha Jadu",
    lastMessage: "Any one online?",
    image: "assets/user_5.png",
    time: "0m ago",
    isActive: true,
  ),
  Chat(
    name: "Salma Alaa",
    lastMessage: "I am out guys, Bye ?",
    image: "assets/user_5.png",
    time: "15m ago",
    isActive: false,
  ),
  Chat(
    name: "Mohamed Saleh",
    lastMessage: "Any Updates?",
    image: "assets/user_2.png",
    time: "5m ago",
    isActive: false,
  ),
  Chat(
    name: "Hage Moh",
    lastMessage: "Hello Guys",
    image: "assets/user_5.png",
    time: "10m ago",
    isActive: true,
  ),
];
