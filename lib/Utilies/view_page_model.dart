class ViewModel {
  final String fullName, profession, bio, slackName, gitHandle, emailHandle;

  ViewModel({required this.fullName, required this.profession, required this.bio, required this.slackName, required this.gitHandle, required this.emailHandle});

  factory ViewModel.personalModel()=> ViewModel(
    fullName: 'Chijindu Edeh', 
    profession: 'Flutter Developer', 
    bio: 'Experienced Flutter developer with a focus on cross-platform mobile app development. Proficient in state management and Firebase integration. Skilled in building robust and efficient applications. ', 
    slackName: 'ChijinduEdeh', 
    gitHandle: 'GitHub.com/Edeh-cj', 
    emailHandle: 'ceejosh360@gmail.com'
    );
  
}
