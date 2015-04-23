#! /usr/bin/env ruby

#> Given:
# A git repo: hello.git
#     With uncommitted changes
# A number x

#> When X seconds have elapsed since the script was called
#> Then all uncommitted changes will be reverted


#> Given:
# A git repo in a different directory: ../otherrepo/hello.git
#    With uncommitted changes
# A number x

#> When X seconds have elapsed since the script was called
#> Then all uncommitted changes will be reverted


#> Given:
# A git repo: hello.git
#    With uncommitted changes
# A number x

#> When n seconds have elapsed since the last commit and n < x:
#> Then the uncommited changed will still be there


#> Given:
# A git repo with no uncommitted changes
# A number x

#> When the user starts the script
#> Then the repository will reverted 2x seconds past start time when I make a change at
#  x + 1 seconds elapsed.

#> Given:
# A git repo with no uncommitted changes
# A number x

#> When the user starts the script
#> Then the repository will reverted 3x seconds past start time when I make a change at
#  2x + 1 seconds elapsed.

git_repo = ARGV[0]
countdown = ARGV[1].to_i

#time_of_last_commit = `git log --pretty=format:%at`.to_i
#now = Time.now.to_i

#seconds_since_last_commit = now - time_of_last_commit

def revert_after_countdown(repo, num_secs)
    sleep num_secs
    `git --git-dir=#{repo}/.git --work-tree=#{repo} reset --hard HEAD`
end

revert_after_countdown git_repo, countdown
revert_after_countdown git_repo, countdown

#> Given
# A git repo: hello.git
# A number x
# With no uncommitted changes

#> When
# x seconds have passed since this script has called
# No modifications to the repo have been made

#> Then
# The repository should be unchanged


# Get a git directory and number of seconds (= x)


# After x seconds from now have elapsed, revert any
# uncommitted changes in the repository
