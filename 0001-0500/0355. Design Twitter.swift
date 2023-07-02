class Twitter {

    // Solution by Sergey Leschev

    // 355. Design Twitter
    // Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the 10 most recent tweets in the user's news feed.
    // Implement the Twitter class:
    // Twitter() Initializes your twitter object.
    // void postTweet(int userId, int tweetId) Composes a new tweet with ID tweetId by the user userId. Each call to this function will be made with a unique tweetId.
    // List<Integer> getNewsFeed(int userId) Retrieves the 10 most recent tweet IDs in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user themself. Tweets must be ordered from most recent to least recent.
    // void follow(int followerId, int followeeId) The user with ID followerId started following the user with ID followeeId.
    // void unfollow(int followerId, int followeeId) The user with ID followerId started unfollowing the user with ID followeeId.

    // Example 1:
    // Input
    // ["Twitter", "postTweet", "getNewsFeed", "follow", "postTweet", "getNewsFeed", "unfollow", "getNewsFeed"]
    // [[], [1, 5], [1], [1, 2], [2, 6], [1], [1, 2], [1]]
    // Output
    // [null, null, [5], null, null, [6, 5], null, [5]]
    // Explanation
    // Twitter twitter = new Twitter();
    // twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
    // twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
    // twitter.follow(1, 2);    // User 1 follows user 2.
    // twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
    // twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
    // twitter.unfollow(1, 2);  // User 1 unfollows user 2.
    // twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.

    // Constraints:
    // 1 <= userId, followerId, followeeId <= 500
    // 0 <= tweetId <= 10^4
    // All the tweets have unique IDs.
    // At most 3 * 10^4 calls will be made to postTweet, getNewsFeed, follow, and unfollow.

    class Tweet {
        let id: Int
        var timestamp = 0
        var next: Tweet? = nil

        init(_ id: Int) { self.id = id }
    }

    var totalTweets = 0
    var tweets: [Int: Tweet] = [:]  // [userId: Tweet]
    var followings: [Int: Set<Int>] = [:]  // [follower: [followees]]

    /** Initialize your data structure here. */
    init() {}

    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        totalTweets += 1

        let tweet = Tweet(tweetId)
        tweet.timestamp = totalTweets  // simulate timestamp

        if let lastTweet = tweets[userId] { tweet.next = lastTweet }
        tweets[userId] = tweet
    }

    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        var users: Set<Int> = [userId]
        for id in followings[userId] ?? [] { users.insert(id) }

        var userTweets: [Tweet] = []
        for id in users {
            if let tweet = tweets[id] { userTweets.append(tweet) }
        }

        var feeds: [Int] = []
        while !userTweets.isEmpty && feeds.count < 10 {
            var latestIndex = -1

            for i in 0..<userTweets.count {
                if latestIndex == -1 || userTweets[i].timestamp > userTweets[latestIndex].timestamp
                {
                    latestIndex = i
                }
            }

            if latestIndex != -1 {
                let tweet = userTweets[latestIndex]
                if tweet.next != nil {
                    userTweets[latestIndex] = tweet.next!
                } else {
                    userTweets.remove(at: latestIndex)
                }
                feeds.append(tweet.id)
            }
        }

        return feeds
    }

    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        followings[followerId, default: []].insert(followeeId)
    }

    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followings[followerId, default: []].remove(followeeId)
    }

}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
