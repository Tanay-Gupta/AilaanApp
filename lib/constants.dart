import 'package:flutter/material.dart';

// Colors
const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

// My Text Styles
const kHeadingextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 18,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);
//Animation links

const String livePulseAnimation = 'assets/animations/livePulse.json';
const String loadingAnimation = 'assets/animations/loading.json';
var pictureId = {
  'CodeChef': 'assets/icons/codechef.svg',
  'AtCoder': 'assets/icons/atcoder.svg',
  'CodeForces': 'assets/icons/codeforces.svg',
  'CF::Gym': 'assets/icons/codeforces.svg',
  'HackerEarth': 'assets/icons/hackerearth.svg',
  'HackerRank': 'assets/icons/hackerrank.svg',
  'LeetCode': 'assets/icons/leetcode.svg',
  'Kick Start': 'assets/icons/google.svg',
  'TopCoder': 'assets/icons/topcoder.svg',
  'CS Academy': 'assets/icons/csAcadmey.png'
};
List contestName = [
  'CodeChef',
  'CodeForces',
  'HackerEarth',
  'CF::Gym',
  'HackerRank',
  'LeetCode',
  'Kick Start',
  'TopCoder',
  'AtCoder'
];
var ContestWebsiteUrl = {
  'CodeChef': 'www.codechef.com',
  'CodeForces': 'www.codeforces.com',
  'HackerEarth': 'www.hackerearth.com',
  'CF::Gym': 'www.codeforces.com/gym',
  'HackerRank': 'www.hackerrank.com',
  'LeetCode': 'www.leetcode.com',
  'Kick Start': 'www.codingcompetitions.withgoogle.com',
  'TopCoder': 'www.topcoder.com',
  'AtCoder': 'www.atcoder.jp',
  'CS Academy': 'www.csacademy.com'
};
var contestNameWithUrl = {
  'CodeChef': codeChefUrl,
  'CodeForces': codeForcesUrl,
  'HackerEarth': hackerEarthUrl,
  'CF::Gym': codeForcesGymUrl,
  'HackerRank': hackerRankUrl,
  'LeetCode': leetCodeUrl,
  'Kick Start': kickStartUrl,
  'TopCoder': topCoderUrl,
  'AtCoder': atCoderUrl
};

const String listOfSupportedSitesUrl = 'https://kontests.net/api/v1/sites';

const String allContestUrl = 'https://kontests.net/api/v1/all';

const String codeChefUrl = 'https://kontests.net/api/v1/code_chef';

const String codeForcesUrl = 'https://kontests.net/api/v1/codeforces';

const String codeForcesGymUrl = 'https://kontests.net/api/v1/codeforces_gym';

const String topCoderUrl = 'https://kontests.net/api/v1/top_coder';

const String atCoderUrl = 'https://kontests.net/api/v1/at_coder';

const String cSAcademyUrl = 'https://kontests.net/api/v1/cs_academy';

const String hackerRankUrl = 'https://kontests.net/api/v1/hacker_rank';

const String hackerEarthUrl = 'https://kontests.net/api/v1/hacker_earth';

const String kickStartUrl = 'https://kontests.net/api/v1/kick_start';

const String leetCodeUrl = 'https://kontests.net/api/v1/leet_code';




// Feild	Description
// name	Contest name.
// url	Contest link.
// start_time	Start time of the contest in UTC (Format: %Y-%m-%dT%H:%M:%S.%LZ) if exists, - otherwise.
// end_time	End time of the contest in UTC (Format: %Y-%m-%dT%H:%M:%S.%LZ) if exists, - otherwise.
// duration	Contest duration in seconds if exists, - otherwise.
// in_24_hours	Yes if the contest starts within the next 24 hours, No otherwise.
// status	CODING if the contest is running, BEFORE otherwise.