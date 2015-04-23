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


git_repo = ARGV[0]
countdown = ARGV[1].to_i

#time_of_last_commit = `git log --pretty=format:%at`.to_i
#now = Time.now.to_i

#seconds_since_last_commit = now - time_of_last_commit

sleep countdown
`git --git-dir=#{git_repo}/.git --work-tree=#{git_repo} reset --hard HEAD`

#> Given
# A git repo: hello.git
# A number x
# With no uncommitted changes

#> When
# x seconds have passed since this script has called
# No modifications to the repo have been made

#> Then
# The repository should be unchanged



#take_baby_steps . 120

#Max(X seconds since the last commit, X seconds since script ran) > 120  -> Revert



# Get a git directory and number of seconds (= x)


# After x seconds from now have elapsed, revert any
# uncommitted changes in the repository
